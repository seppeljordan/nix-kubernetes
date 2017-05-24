{
  networkpolicy = {
    kubernetes.namespaces.networkpolicy = {
      networkPolicy.ingress.isolation = "DefaultDeny";
    };

    kubernetes.pods.redis = {
      annotations.environment = "networkpolicy";
      labels.name = "redis";
      containers.test = {
        image = "redis";
        ports = [{port = 6379;}];
      };
    };

    kubernetes.services.redis.ports = [{port = 6379;}];

    kubernetes.pods.client1 = {
      labels.name = "client1";
      containers.test = {
        image = "busybox";
        command = ["bin/sh" "-c" ''
          while true; do
            echo ping |timeout -t 5 nc redis 6379
            sleep 1
          done
        ''];
      };
    };

    kubernetes.pods.client2 = {
      labels.name = "client2";
      containers.test = {
        image = "busybox";
        command = ["bin/sh" "-c" ''
          while true; do
            echo ping |timeout -t 5 nc redis 6379
            sleep 1
          done
        ''];
      };
    };

    kubernetes.networkPolicies.redis = {
      podSelector.matchLabels.name = "redis";
      ingress.client1.ports = [{ port = 6379; }];
    };
  };
}
