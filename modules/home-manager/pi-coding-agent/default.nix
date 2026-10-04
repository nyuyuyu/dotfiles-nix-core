{ inputs, pkgs, ... }:

{
  config.home.packages = [
    inputs.pi.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
