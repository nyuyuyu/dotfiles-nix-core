{
  pkgsUnstable,
  ...
}:

{
  config = {
    home.packages = [
      pkgsUnstable.opencode
    ];

    xdg.configFile."opencode/opencode.jsonc".source = ./opencode.jsonc;
    xdg.configFile."opencode/cli.json".source = ./cli.json;
  };
}
