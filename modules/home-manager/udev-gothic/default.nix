{ pkgs, ... }:

{
  config.home = {
    packages = [
      pkgs.udev-gothic
    ];
  };

  config.fonts.fontconfig.enable = true;
}
