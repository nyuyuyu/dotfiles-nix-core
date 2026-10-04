{ pkgs, ... }:

{
  config.home = {
    packages = [
      pkgs.udev-gothic-nf
    ];
  };

  config.fonts.fontconfig.enable = true;
}
