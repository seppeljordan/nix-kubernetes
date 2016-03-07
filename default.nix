{ pkgs ? import <nixpkgs> {}, configuration ? ./test.nix }:

with pkgs.lib;

with import ./lib.nix { inherit (pkgs) lib; };

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

    rcs = mapAttrs (name: ctrl: mkController ctrl) config.kubernetes.controllers;
    services = mapAttrs (name: service: mkService service) config.kubernetes.services;
  in pkgs.stdenv.mkDerivation {
    name = "configurations";
    buildCommand = ''
      mkdir -p $out
      cp ${pkgs.writeText "controllers.json" (builtins.toJSON rcs)} $out/controllers.json
      cp ${pkgs.writeText "services.json" (builtins.toJSON services)} $out/services.json
    '';
  }
) deployments
