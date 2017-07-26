{
  pv = {
    kubernetes.namespaces.test = {};

    kubernetes.pv.test = {
      capacity.storage = "100M";
      accessModes = ["ReadWriteOnce"];
      persistentVolumeReclaimPolicy = "Delete";
      storageClassName = "local";
      local.path = "/data";
    };
  };
}
