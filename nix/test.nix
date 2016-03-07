{
  gatehub-staging = {
    require = import <services/module-list.nix>;

    services.mysql.enable = true;
    services.mysql.rootPassword = "root";
    services.elasticsearch.enable = true;
    services.elasticsearch.clusterName = "gatehub";
    services.redis.enable = true;
    services.redis.password = "test";
  };
}
