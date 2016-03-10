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
        type = types.attrsOf types.str;
        default = {};
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

  podOptions = { name, config, ... }: {
    options = {
      name = mkOption {
        description = "Name of the pod";
        type = types.str;
        default = name;
      };

      labels = mkOption {
        description = "Pod labels";
        type = types.attrsOf types.str;
        default = {};
      };

      dependencies = mkOption {
        description = "Pod dependencies";
        default = [];
        type = types.listOf types.str;
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
    };
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

      pod = {
        labels = mkOption {
          description = "Pod labels";
          type = types.attrsOf types.str;
          default = config.selector;
        };

        containers = mkOption {
          type = types.attrsOf types.optionSet;
          options = [ containerOptions ];
        };

        volumes = mkOption {
          type = types.attrsOf types.optionSet;
          options = [ volumeOptions ];
          default = {};
        };
      };
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

      ports = mkOption {
        type = types.listOf types.optionSet;
        options = { config, ... }: {
          options = {
            name = mkOption {
              description = "Name of the port";
              type = types.nullOr types.str;
              default = null;
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
  };
}
