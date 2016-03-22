{ config, pkgs, lib, ... }:

with lib;

let

  containerOptions = { name, config, ... }: {
    options = {
      enable = mkOption {
        description = "Whether to enable container";
        default = true;
        type = types.bool;
      };

      name = mkOption {
        description = "Name of the pod";
        type = types.str;
        default = name;
      };

      image = mkOption {
        description = "Image to use";
        type = types.str;
      };

      command = mkOption {
        description = "Command to run";
        type = types.nullOr (types.either (types.listOf types.str) types.str);
        default = null;
      };

      args = mkOption {
        description = "Arguments to command";
        type = types.nullOr (types.either (types.listOf types.str) types.str);
        default = null;
      };

      env = mkOption {
        description = "Environment variables to set";
        default = {};
        type = types.attrsOf types.unspecified;
      };

      postStart = {
        command = mkOption {
          description = "Command to execute in post start phase";
          type = types.nullOr (types.either (types.listOf types.str) types.str);
          default = null;
        };
      };

      security = {
        capabilities = {
          add = mkOption {
            description = "Capabilites to add";
            type = types.listOf types.str;
            default = [];
          };
        };

        privileged = mkOption {
          description = "Whether to run container as privileged";
          type = types.bool;
          default = false;
        };
      };

      ports = mkOption {
        description = "Ports exposed by pod";
        type = types.listOf types.optionSet;
        default = [];

        options = { config, ... }: {
          options = {
            name = mkOption {
              description = "Name of the port";
              type = types.nullOr types.str;
              default = null;
            };

            protocol = mkOption {
              description = "Protocol to use";
              default = "TCP";
              type = types.enum ["TCP" "UDP"];
            };

            port = mkOption {
              description = "Port to expose";
              type = types.int;
            };

            containerPort = mkOption {
              description = "Port in container";
              default = config.port;
              type = types.int;
            };
          };
        };
      };

      mounts = mkOption {
        description = "Volumes mounted in pod";
        type = types.listOf types.optionSet;
        default = [];

        options = {
          name = mkOption {
            description = "Name of the volume";
            type = types.str;
          };

          mountPath = mkOption {
            description = "Mount path of volume";
            type = types.path;
          };
        };
      };
    };
  };

  volumeOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the volume";
        type = types.str;
        default = name;
      };

      type = mkOption {
        description = "Volume type";
        type = types.str;
      };

      options = mkOption {
        description = "Volume options";
        type = types.attrs;
        default = {};
      };
    };
  };

  podTemplate = {
    labels = mkOption {
      description = "Pod labels";
      type = types.attrsOf types.str;
      default = {};
    };

    annotations = mkOption {
      description = "Pod annotation";
      type = types.attrsOf types.str;
      default = {};
    };

    nodeSelector = mkOption {
      description = "Node selector where to put pod";
      type = types.attrsOf types.str;
      default = {};
    };

    containers = mkOption {
      description = "Pod containers";
      type = types.attrsOf types.optionSet;
      options = [ containerOptions ];
    };

    volumes = mkOption {
      description = "Pod volumes";
      type = types.attrsOf types.optionSet;
      options = [ volumeOptions ];
      default = {};
    };

    restartPolicy = mkOption {
      description = "Pod restart policy";
      type = types.enum ["Always" "OnFailure" "Never"];
      default = "Always";
    };
  };

  podOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the pod";
        type = types.str;
        default = name;
      };

      dependencies = mkOption {
        description = "Pod dependencies";
        default = [];
        type = types.listOf types.str;
      };
    } // podTemplate;
  };

  controllerOptions = { name, config, ... }: {
    options = {
      enable = mkOption {
        description = "Whether to enable container";
        default = false;
        type = types.bool;
      };

      name = mkOption {
        description = "Name of the controller";
        type = types.str;
        default = name;
      };

      namespace = mkOption {
        description = "Repplication controller namespace";
        type = types.str;
        default = "default";
      };

      labels = mkOption {
        description = "Controller labels";
        type = types.attrsOf types.str;
        default = {};
      };

      selector = mkOption {
        description = "Pod selector";
        type = types.attrsOf types.str;
        default = { inherit name; };
      };

      replicas = mkOption {
        description = "Number of replicas to run";
        default = 1;
        type = types.int;
      };

      dependencies = mkOption {
        description = "Replication controller dependencies";
        default = [];
        type = types.listOf types.str;
      };

      pod = podTemplate;
    };

    config = {
      pod.labels.name = mkDefault config.name;
    };
  };

  serviceOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Service name";
        default = name;
        type = types.str;
      };

      labels = mkOption {
        description = "Service labels";
        type = types.attrsOf types.str;
        default = {};
      };

      type = mkOption {
        description = "Service type (ClusterIP, NodePort, LoadBalancer)";
        type = types.enum ["ClusterIP" "NodePort" "LoadBalancer"];
        default = "ClusterIP";
      };

      ports = mkOption {
        type = types.listOf types.optionSet;
        options = { config, ... }: {
          options = {
            name = mkOption {
              description = "Name of the port";
              type = types.nullOr types.str;
              default = null;
            };

            protocol = mkOption {
              description = "Protocol to use";
              default = "TCP";
              type = types.enum ["TCP" "UDP"];
            };

            port = mkOption {
              description = "Port to expose";
              type = types.int;
            };

            targetPort = mkOption {
              default = config.port;
              type = types.int;
              description = "Pod target port";
            };
          };
        };
      };

      selector = mkOption {
        description = "Service selector";
        type = types.attrsOf types.str;
        default = { inherit name; };
      };
    };
  };

  namespaceOptions = {
    name = mkOption {
      description = "Namespace name";
      default = "default";
      type = types.str;
    };

    labels = mkOption {
      description = "Namespace labels";
      type = types.attrsOf types.str;
      default = {};
    };
  };

  pvcOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of persistent volume claim";
        type = types.str;
        default = name;
      };

      size = mkOption {
        description = "Size of storage requested by persistent volume claim";
        type = types.str;
        default = "1G";
        example = "10G";
      };

      accessModes = mkOption {
        description = "Requested acces modes";
        type = types.listOf (types.enum ["ReadWriteOnce"]);
        default = ["ReadWriteOnce"];
      };
    };
  };

  secretOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the secret";
        type = types.str;
        default = name;
      };

      secrets = mkOption {
        description = "Files to include in secret";
        type = types.attrs;
      };
    };
  };

  ingressOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the ingress";
        type = types.str;
        default = name;
      };

      rules = mkOption {
        description = "Attribute set of rules";
        type = types.attrsOf types.optionSet;
        options = { name, config, ... }: {
          options = {
            host = mkOption {
              description = "Ingress host";
              type = types.nullOr types.str;
            };

            http.paths = mkOption {
              description = "Attribute set of paths";
              type = types.attrsOf types.optionSet;
              options = { name, config, ... }: {
                options = {
                  path = mkOption {
                    description = "Path to route";
                    type = types.str;
                    default = name;
                  };

                  backend.serviceName = mkOption {
                    description = "Name of the service to route to";
                    type = types.str;
                  };

                  backend.servicePort = mkOption {
                    description = "Service port to route to";
                    type = types.int;
                    default = 80;
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  jobOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the job";
        type = types.str;
        default = name;
      };

      pod = podTemplate;
    };

    config = {
      pod.restartPolicy = mkDefault "Never";
    };
  };

in {
  options.kubernetes = {
    namespace = namespaceOptions;

    pods = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ podOptions ];
      description = "Attribute set of pods";
      default = {};
    };

    controllers = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ controllerOptions ];
      description = "Attribute set of controllers";
      default = {};
    };

    services = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ serviceOptions ];
      description = "Attribute set of services";
      default = {};
    };

    pvc = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ pvcOptions ];
      description = "Attribute set of persistent volume claims";
      default = {};
    };

    secrets = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ secretOptions ];
      description = "Attribute set of secrets";
      default = {};
    };

    ingress = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ ingressOptions ];
      description = "Attribute set of ingress";
      default = {};
    };

    jobs = mkOption {
      type = types.attrsOf types.optionSet;
      options = [ jobOptions ];
      description = "Attribute set of jobs";
      default = {};
    };
  };
}
