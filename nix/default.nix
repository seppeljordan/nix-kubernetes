{ pkgs ? import <nixpkgs> {}, configuration ? ./test.nix, args ? null, ... }:

with pkgs.lib;

with import ./lib.nix { inherit (pkgs) lib; inherit pkgs; };

let
  argsContent =
    if args != null
    then builtins.fromJSON (builtins.readFile args)
    else {};

  deployments = import configuration;

  # Evaluates deployment
  evalDeployment = name: deployment: let
    otherDeployments = filterAttrs (name2: _: name != name2) deployments;
  in (evalModules {
    modules = [./options.nix deployment argsContent];
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
      pv =
        mapAttrs (name: pv: mkPv pv) config.kubernetes.pv;
      storageclasses =
        mapAttrs (name: storageclass: mkStorageClass storageclass) config.kubernetes.storageClass;
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
      configmaps =
        mapAttrs (name: configMap: mkConfigMap configMap) config.kubernetes.configMaps;
      petsets =
        mapAttrs (name: petset: mkPetSet petset) config.kubernetes.petSets;
      statefulsets =
        mapAttrs (name: statefulset: mkStatefulSet statefulset) config.kubernetes.statefulSets;
      networkpolicies =
        mapAttrs (name: networkpolicy: mkNetworkPolicy networkpolicy) config.kubernetes.networkPolicies;
      poddistributionbudgets =
        mapAttrs (name: pdb: mkPodDistributionBudget pdb) config.kubernetes.podDistributionBudgets;
      customresourcedefinitions =
        mapAttrs (name: crd: mkCustomResourceDefinition crd) config.kubernetes.customResourceDefinitions;
    } // (mapAttrs (name: customResources: (
      mapAttrs (name: customResource: mkCustomResource customResource) customResources
    )) config.kubernetes.customResources);

    # Keep jobs separated from other resources, as they have to be explicitly
    # started
    jobs = mapAttrs (name: job: mkJob job) config.kubernetes.jobs;

    gcNamespaces = config.kubernetes.gcNamespaces;
  }) deployments;
in pkgs.stdenv.mkDerivation {
  name = "configurations";
  buildCommand = ''
    cp ${pkgs.writeText "result.json" (builtins.toJSON result)} $out
  '';
}
