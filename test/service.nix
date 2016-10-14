{
  service = {
    kubernetes.services = {
      simple.ports = [{port = 6379;}];
      multiple.ports = [
        {port = 80; name = "http";}
        {port = 443; name = "https";}
      ];
      withSelector = {
        selector.app = "mysql";
        ports = [{port = 3306;}];
      };
      annotations = {
        annotations.key = "value";
        ports = [{port = 3306;}];
      };
      withType = {
        type = "LoadBalancer";
        ports = [{port = 3306;}];
      };
    };
  };
}
