{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

{
  config.home.packages = [
    inputs.nono.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
