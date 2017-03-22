{
  configmap = {pkgs, ...}: {
    kubernetes.pods.configmappod = {
      dependencies = ["configmaps/config"];

      containers.test = {
        env.KEY = "configMap:config:key1.key2.key3";
        image = "redis";
        ports = [{port = 6379;}];
      };
      volumes.test.type = "emptyDir";
    };

    kubernetes.configMaps.config = {
      data.key1.key2.key3 = "value";
    };
  };
}
