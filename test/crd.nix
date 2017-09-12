{
  crd = {
    kubernetes.customResourceDefinitions.etcdclusters = {
      group = "etcd.database.coreos.com";
      version = "v1beta2";
      names = {
        plural = "etcdclusters";
        kind = "EtcdCluster";
        shortNames = ["etcd"];
      };
    };
  };
}
