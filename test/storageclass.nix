{
  storageclass = {
    kubernetes.namespaces.test = {};

    kubernetes.storageClass.test = {
      provisioner = "kubernetes.io/gce-pd";
      parameters = {
        type = "pd-standard";
        zone = "us-central1-a";
      };
    };
  };
}
