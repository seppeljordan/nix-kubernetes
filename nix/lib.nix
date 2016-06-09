{ lib, pkgs }:

with lib;

rec {
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

  mkSpec = resource: {
    nodeSelector = resource.nodeSelector;

    containers = mapAttrsToList (name: container:
      mkContainer container
    ) resource.containers;

    volumes = mapAttrsToList (name: volume:
      mkVolume volume
    ) resource.volumes;

    restartPolicy = resource.restartPolicy;
  };

  mkPod = pod: {
    kind = "Pod";
    apiVersion = "v1";

    metadata = {
      name = pod.name;
      labels = pod.labels;
      annotations = {
        "x-truder.net/dependencies" = concatStringsSep "," pod.dependencies;
      } // pod.annotations;
    };

    spec = mkSpec pod;
  };

  mkVolume = volume: {
    name = volume.name;
    ${volume.type} = volume.options;
  };

  mkController = rc: {
    apiVersion = "v1";
    kind = "ReplicationController";
    metadata = {
      name = rc.name;
      labels = rc.labels;
      annotations = {
        "x-truder.net/dependencies" = concatStringsSep "," rc.dependencies;
      } ;
    };
    spec = {
      replicas = rc.replicas;
      selector = rc.selector;
      template = {
        metadata = {
          labels = rc.pod.labels;
        };

        spec = mkSpec rc.pod;
      };
    };
  };

  mkService = service: {
    apiVersion = "v1";
    kind = "Service";
    metadata = {
      name = service.name;
      labels = service.labels;
    };
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

  mkPvc = pvc: {
    apiVersion = "v1";
    kind = "PersistentVolumeClaim";
    metadata = {
      name = pvc.name;
    };
    spec = {
      accessModes = pvc.accessModes;
      resources = {
        requests = {
          storage = pvc.size;
        };
      };
    };
  };

  mkNamespace = ns: {
    apiVersion = "v1";
    kind = "Namespace";
    metadata = {
      name = ns.name;
      labels = ns.labels;
    };
  };

  mkSecret = secret: {
    apiVersion = "v1";
    kind = "Secret";
    metadata = {
      name = secret.name;
    };
    data = mapAttrs (name: secret:
      builtins.readFile (pkgs.stdenv.mkDerivation {
        name = "secret-${name}";
        buildCommand = ''
          cat ${secret} | ${pkgs.coreutils}/bin/base64 -w0 > $out
        '';
      })
    ) secret.secrets;
  };

  mkIngress = ing: {
    apiVersion = "extensions/v1beta1";
    kind = "Ingress";
    metadata.name = ing.name;
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

  mkJob = job: {
    apiVersion = "extensions/v1beta1";
    kind = "Job";
    metadata = {
      name = job.name;
    };
    spec = {
      template = {
        metadata = {
          labels = job.pod.labels;
        };

        spec = mkSpec job.pod;
      };
    };
  };
}
