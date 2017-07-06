{
  job = {config, lib, ...}: with lib; {
    options = {
      inspector.path = mkOption {
        default = "/";
        type = types.str;
      };
    };

    config = {
      kubernetes.namespaces.test = {};

      kubernetes.jobs.test = {
        pod.containers.test = {
          image = "busybox";
          command = "ls -la ${config.inspector.path}";
        };
      };
    };
  };
}
