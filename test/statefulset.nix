{
  statefulsets = {
    kubernetes.namespaces.test = {};
    kubernetes.statefulSets.test = {
      name = "test";
      annotations.environment = "production";

      serviceName = "abcd";
      replicas = 3;

      pod.containers.test = {
        image = "redis";
        ports = [{port = 6379;}];
      };

      volumeClaimTemplates.test = {
        accessModes = ["ReadWriteOnce"];
        size = "1G";
      };
    };
  };
}
