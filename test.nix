{
  gatehub-staging = {
    kubernetes.namespace.name = "staging";
    kubernetes.controllers.mysql = {
      pod.containers.test = {
        image = "mysql:5.6";
        env = {
          MYSQL_ROOT_PASSWORD = "test";
          MYSQL_DATABASE = "staging";
          MYSQL_USER = "staging";
          MYSQL_PASSWORD = "test2";
        };
        mounts = [{
          name = "storage";
          mountPath = "/var/lib/mysql";
        }];
      };

      pod.volumes.storage = {
        type = "persistentVolumeClaim";
        options.claimName = "mysql";
      };
    };
    kubernetes.services.mysql = {
      ports = [{ port = 3306; }];
    };
  };
}
