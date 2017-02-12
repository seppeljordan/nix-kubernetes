{
  configmap = {
    kubernetes.namespaces.configmap = {};
    kubernetes.configMaps.test.data = {
      some.key = "somevalue";
      some.complex.key = {
        some = "value";
      };
    };
  };
}
