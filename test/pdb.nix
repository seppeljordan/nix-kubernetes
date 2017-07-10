{
  pdb = {
    kubernetes.namespaces.test = {};

    kubernetes.deployments.myapp = {
      replicas = 3;
      pod.containers.nginx.image = "nginx";
    };

    kubernetes.podDistributionBudgets.test = {
      minAvailable = "60%";
      selector.matchLabels = {
        name = "myapp";
      };
    };
  };
}
