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

in mapAttrs (name: deployment:
  let
    config = configForDeployment deployment;

    result = {
      namespace = mkNamespace config.kubernetes.namespace;
      replicationcontrollers =
        mapAttrs (name: ctrl: mkController ctrl) config.kubernetes.controllers;
      services =
        mapAttrs (name: service: mkService service) config.kubernetes.services;
      pvc =
        mapAttrs (name: pvc: mkPvc pvc) config.kubernetes.pvc;
      secrets =
        mapAttrs (name: secret: mkSecret secret) config.kubernetes.secrets;
    };
  in pkgs.stdenv.mkDerivation {
    name = "configurations";
    buildCommand = ''
      cp ${pkgs.writeText "result.json" (builtins.toJSON result)} $out
    '';
  }
) deployments
