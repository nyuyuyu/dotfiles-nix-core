{
  pkgs,
  ...
}:

{
  config = {
    home = {
      packages = [
        pkgs.udev-gothic
      ];
    };

    fonts.fontconfig.enable = true;
  };
}
