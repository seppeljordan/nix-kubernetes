{
  secret = {pkgs, ...}: {
    kubernetes.pods.secretpod = {
      dependencies = ["secrets/secret"];

      containers.test = {
        env.KEY = "secret:name:key";
        image = "redis";
        ports = [{port = 6379;}];
      };
      volumes.test.type = "emptyDir";
    };

    kubernetes.secrets.secret = {
      secrets.key = "value";
    };
  };
}
