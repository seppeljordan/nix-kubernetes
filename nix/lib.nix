{ lib }:

with lib;

rec {
  mkCommand = cmd: if isString cmd then (splitString " " cmd) else cmd;

  mkContainer = container: {
    name = container.name;
    image = container.image;
    imagePullPolicy = "Always";
    securityContext = container.security;
    ports = map (port: {
      containerPort = port.containerPort;
      port = port.port;
    } // (optionalAttrs (port.name != null) {
      name = port.name;
    })) container.ports;
    volumeMounts = map (volume: {
      name = volume.name;
      mountPath = volume.mountPath;
    }) container.mounts;
    env = mapAttrsToList (name: value: { inherit name value; }) container.env;
  } // (optionalAttrs (container.command != null) {
    command = mkCommand container.command;
  }) // (optionalAttrs (container.args != null) {
    args = mkCommand container.args;
  });

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
    };
    spec = {
      replicas = rc.replicas;
      selector = rc.selector;
      template = {
        metadata = {
          labels = rc.pod.labels;
        };

        spec = {
          containers = mapAttrsToList (name: container:
            mkContainer container
          ) rc.pod.containers;

          volumes = mapAttrsToList (name: volume:
            mkVolume volume
          ) rc.pod.volumes;
        };
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
      }) service.ports;
      selector = service.selector;
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
    };
    resources = {
      requests = {
        storage = pvc.size;
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
}
