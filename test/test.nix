{
  staging = {
    kubernetes.controllers.test = {
      pod.containers.test = {
        image = "test2";
      };
    };

    kubernetes.services.test.ports = [{port = 1000;}];
  };
}
