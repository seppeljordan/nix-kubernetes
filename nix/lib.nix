{ lib, pkgs }:

with lib;

let
  mkResource = apiVersion: kind: { inherit apiVersion kind; };

  mkMeta = resource: {
    metadata.namespace = resource.namespace;
    metadata.name = resource.name;
    metadata.labels = resource.labels;
    metadata.annotations = resource.annotations // {
      "x-truder.net/dependencies" = concatStringsSep "," resource.dependencies;
    };
  };

  mkSpecMeta = resource: {
    metadata.labels = resource.labels;
    metadata.annotations = resource.annotations;
  };

  mkCommand = cmd: if isString cmd then ["sh" "-c" cmd] else cmd;

  filterNull = attrs: (filterAttrs (n: v: v != null) attrs);

  mkContainer = container: {
    name = container.name;
    image = container.image;
    imagePullPolicy = "Always";
    securityContext = container.security;
    ports = map (port: {
      containerPort = port.port;
      protocol = port.protocol;
    } // (optionalAttrs (port.name != null) {
      name = port.name;
    })) container.ports;
    volumeMounts = map (volume: {
      name = volume.name;
      mountPath = volume.mountPath;
    }) container.mounts;
    env = mapAttrsToList (name: value: {
      inherit name;
    } // (optionalAttrs (isAttrs value) {
      valueFrom = value;
    }) // (optionalAttrs (isString value) {
      inherit value;
    })) container.env;
    resources.limits = filterNull container.limits;
    resources.requests = filterNull container.requests;
  } // (optionalAttrs (container.command != null) {
    command = mkCommand container.command;
  }) // (optionalAttrs (container.args != null) {
    args = mkCommand container.args;
  }) // (optionalAttrs (container.postStart.command != null) {
    lifecycle.postStart.exec.command = mkCommand container.postStart.command;
  }) // (optionalAttrs (container.livenessProbe.httpGet.path != null) {
    livenessProbe = container.livenessProbe;
  });

  mkVolume = volume: {
    name = volume.name;
    ${volume.type} = volume.options;
  };

  mkPodSpec = resource: {
    spec = {
      nodeSelector = resource.nodeSelector;

      containers = mapAttrsToList (name: container:
        mkContainer container
      ) resource.containers;

      volumes = mapAttrsToList (name: volume:
        mkVolume volume
      ) resource.volumes;

      restartPolicy = resource.restartPolicy;

      imagePullSecrets = map (secret: {
        name = secret;
      }) resource.imagePullSecrets;
    };
  };

  mkControllerSpec = rc: {
    spec = {
      replicas = rc.replicas;
      selector = rc.selector;
      template = (mkSpecMeta rc.pod) // (mkPodSpec rc.pod);
    };
  };

  mkDeploymentSpec = deployment: {
    spec = {
      replicas = deployment.replicas;
      template = (mkSpecMeta deployment.pod) // (mkPodSpec deployment.pod);
    };
  };

  mkDaemonSetSpec = daemon: {
    spec = {
      template = (mkSpecMeta daemon.pod) // (mkPodSpec daemon.pod);
    };
  };

  mkServiceSpec = service: {
    spec = {
      ports = map (port: {
        port = port.port;
        targetPort = port.targetPort;
        protocol = port.protocol;
      } // (optionalAttrs (port.name != null) {
        name = port.name;
      } // (optionalAttrs (port.nodePort != null) {
        nodePort = port.nodePort;
      }))) service.ports;
      selector = service.selector;
      type = service.type;
    };
  };

  mkPvcSpec = pvc: {
    spec = {
      accessModes = pvc.accessModes;
      resources = {
        requests = {
          storage = pvc.size;
        };
      };
    };
  };

  mkSecretData = secret: {
    data = mapAttrs (name: secret:
      builtins.readFile (pkgs.stdenv.mkDerivation {
        name = "secret-${name}";
        buildCommand = ''
          cat ${secret} | ${pkgs.coreutils}/bin/base64 -w0 > $out
        '';
      })
    ) secret.secrets;
    type = secret.type;
  };

  mkIngressSpec = ing: {
    spec = {
      rules = mapAttrsToList (name: rule: {
        host = rule.host;
        http.paths = mapAttrsToList (name: path: {
          path = path.path;
          backend = path.backend;
        }) rule.http.paths;
      }) ing.rules;
    } // (optionalAttrs (ing.tls.secretName != null) {
      tls = [{
        secretName = ing.tls.secretName;
      }];
    });
  };

  mkJobSpec = job: {
    spec.template = (mkSpecMeta job.pod) // (mkPodSpec job.pod);
    spec.activeDeadlineSeconds = job.activeDeadlineSeconds; 
  };

  mkScheduledJobSpec = scheduledJob: {
    spec = {
      suspend = !scheduledJob.enable;
      schedule = scheduledJob.schedule;
      jobTemplate = (mkSpecMeta scheduledJob.job) // (mkJobSpec scheduledJob.job);
      concurrencyPolicy = scheduledJob.concurrencyPolicy;
    };
  };

  mkNetworkPolicy = policy: {
    spec = {
      podSelector.matchLabels = policy.podSelector.matchLabels;
      ingress = mapAttrsToList (name: rule: {
        from = mkMerge ((optionals rule.namespaceSelector [{
          namespaceSelector.matchLabels = rule.namespaceSelector;
        }]) (optionals rule.podSelector [{
          podSelector.matchLabels = rule.podSelector.matchLabels;
        }]));
      }) policy.ingress;
    };
  };
in {
  mkNamespace = namespace:
    (mkResource "v1" "Namespace") // (mkMeta namespace);

  mkPod = pod:
    (mkResource "v1" "Pod") // (mkMeta pod) //
    (mkPodSpec pod);

  mkService = service:
    (mkResource "v1" "Service") // (mkMeta service) //
    (mkServiceSpec service);

  mkController = controller:
    (mkResource "v1" "ReplicationController") // (mkMeta controller) //
    (mkControllerSpec controller);

  mkDeployment = deployment:
    (mkResource "extensions/v1beta1" "Deployment") // (mkMeta deployment) //
    (mkDeploymentSpec deployment);

  mkDaemonSet = daemon:
    (mkResource "extensions/v1beta1" "DaemonSet") // (mkMeta daemon) //
    (mkDaemonSetSpec daemon);

  mkScheduledJob = scheduledJob:
    (mkResource "batch/v2alpha1" "ScheduledJob") // (mkMeta scheduledJob) //
    (mkScheduledJobSpec scheduledJob);

  mkJob = job:
    (mkResource "extensions/v1beta1" "Job") // (mkMeta job) //
    (mkJobSpec job);

  mkIngress = ingress:
    (mkResource "extensions/v1beta1" "Ingress") // (mkMeta ingress) //
    (mkIngressSpec ingress);

  mkSecret = secret:
    (mkResource "v1" "Secret") // (mkMeta secret) //
    (mkSecretData secret);

  mkPvc = pvc:
    (mkResource "v1" "PersistentVolumeClaim") // (mkMeta pvc) //
    (mkPvcSpec pvc);
}
