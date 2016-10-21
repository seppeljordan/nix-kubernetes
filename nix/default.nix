{ pkgs ? import <nixpkgs> {}, configuration ? ./test.nix }:

with pkgs.lib;

with import ./lib.nix { inherit (pkgs) lib; inherit pkgs; };

let
  deployments = import configuration;

  # Evaluates deployment
  evalDeployment = name: deployment: let
    otherDeployments = filterAttrs (name2: _: name != name2) deployments;
  in (evalModules {
    modules = [./options.nix deployment];
    args = {
      inherit pkgs;
      deployments = mapAttrs (
        name: deployment: evalDeployment name deployment
      ) otherDeployments;
    };
  });

  result = mapAttrs (name: deployment: let
    config = (evalDeployment name deployment).config;
  in {
    # Deployment resources
    resources = {
      namespaces =
        mapAttrs (name: ns: mkNamespace ns) config.kubernetes.namespaces;
      pods =
        mapAttrs (name: pod: mkPod pod) config.kubernetes.pods;
      replicationcontrollers =
        mapAttrs (name: ctrl: mkController ctrl) config.kubernetes.controllers;
      deployments =
        mapAttrs (name: deployment: mkDeployment deployment) config.kubernetes.deployments;
      daemonsets =
        mapAttrs (name: daemon: mkDaemonSet daemon) config.kubernetes.daemonsets;
      services =
        mapAttrs (name: service: mkService service) config.kubernetes.services;
      pvc =
        mapAttrs (name: pvc: mkPvc pvc) config.kubernetes.pvc;
      secrets =
        mapAttrs (name: secret: mkSecret secret) config.kubernetes.secrets;
      ingress =
        mapAttrs (name: ing: mkIngress ing) config.kubernetes.ingress;
      scheduledjobs =
        mapAttrs (name: scheduledJob: mkScheduledJob scheduledJob) config.kubernetes.scheduledJobs;
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
