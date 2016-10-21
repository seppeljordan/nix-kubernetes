{
  deployment = {
    kubernetes.namespaces.test = {};
    kubernetes.daemonsets.test = {
      name = "test";
      annotations.environment = "production";

      pod.containers.test = {
        image = "redis";
        ports = [{port = 6379;}];
      };
    };
  };
}
