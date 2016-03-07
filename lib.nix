{ lib }:

with lib;

rec {
  mkContainer = container: {
    name = container.name;
    image = container.image;
    imagePullPolicy = "Always";
    ports = map (port: {
      name = port.name;
      containerPort = port.containerPort;
      port = port.port;
    }) container.ports;
    volumeMounts = map (volume: {
      name = volume.name;
      mountPath = volume.mountPath;
    }) container.mounts;
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
}
