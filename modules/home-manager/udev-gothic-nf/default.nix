{
  pkgs,
  ...
}:

{
  config = {
    home = {
      packages = [
        pkgs.udev-gothic-nf
      ];
    };

    fonts.fontconfig.enable = true;
  };
}
