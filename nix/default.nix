{ pkgs ? import <nixpkgs> {}, configuration ? ./test.nix }:

with pkgs.lib;

with import ./lib.nix { inherit (pkgs) lib; inherit pkgs; };

let
  deployments = import configuration;

  configForDeployment = deployment:
    (evalModules {
      modules = [./options.nix deployment];
      args = { inherit pkgs; };
    }).config;

    result = mapAttrs (name: deployment: let
      config = configForDeployment deployment;
    in {
      # Deployment options
      options = {
        namespace = config.kubernetes.namespace.name;
      };

      # Deployment resources
      resources = {
        namespaces = {
          ${config.kubernetes.namespace.name} = mkNamespace config.kubernetes.namespace;
        };
        pods =
          mapAttrs (name: pod: mkPod pod) config.kubernetes.pods;
        replicationcontrollers =
          mapAttrs (name: ctrl: mkController ctrl) config.kubernetes.controllers;
        deployments =
          mapAttrs (name: deployment: mkDeployment deployment) config.kubernetes.deployments;
        services =
          mapAttrs (name: service: mkService service) config.kubernetes.services;
        pvc =
          mapAttrs (name: pvc: mkPvc pvc) config.kubernetes.pvc;
        secrets =
          mapAttrs (name: secret: mkSecret secret) config.kubernetes.secrets;
        ingress =
          mapAttrs (name: ing: mkIngress ing) config.kubernetes.ingress;
      };

      # Keep jobs separated from other resources, as they have to be explicitly
      # started
      jobs = mapAttrs (name: job: mkJob job) config.kubernetes.jobs;
    }) deployments;
in pkgs.stdenv.mkDerivation {
  name = "configurations";
  buildCommand = ''
    cp ${pkgs.writeText "result.json" (builtins.toJSON result)} $out
  '';
}
