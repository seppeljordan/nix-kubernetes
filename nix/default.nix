{ pkgs ? import <nixpkgs> {}, configuration ? ./test.nix, args ? null, ... }:

with pkgs.lib;

with import ./lib.nix { inherit (pkgs) lib; inherit pkgs; };

let
  argsContent =
    if args != null
    then builtins.fromJSON (builtins.readFile args)
    else {};

  deployments = let
    cfg = import configuration;
  in if isFunction cfg then cfg argsContent else cfg;

  # Evaluates deployment
  evalDeployment = name: deployment: let
    otherDeployments = filterAttrs (name2: _: name != name2) deployments;
  in (evalModules {
    modules = [./options.nix deployment];
    args = {
      inherit pkgs;
      args = argsContent;
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
      roles =
        mapAttrs (name: role: mkRole role) config.kubernetes.roles;
      clusterroles =
        mapAttrs (name: role: mkClusterRole role) config.kubernetes.clusterRoles;
      rolebindings =
        mapAttrs (name: role: mkRoleBinding role) config.kubernetes.roleBindings;
      clusterrolebindings =
        mapAttrs (name: role: mkClusterRoleBinding role) config.kubernetes.clusterRoleBindings;
      serviceaccounts =
        mapAttrs (name: serviceAccount: mkServiceAccount serviceAccount) config.kubernetes.serviceAccounts;
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
