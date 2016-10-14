{
  deployment = {
    kubernetes.namespaces.test = {};
    kubernetes.deployments.test = {
      name = "test";
      annotations.environment = "production";

      replicas = 3;

      pod.containers.test = {
        image = "redis";
        ports = [{port = 6379;}];
      };
    };
  };
}
