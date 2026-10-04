{ ... }:

{
  config.home.shellAliases = {
    opencode = "nix shell nixpkgs#nodejs -c npx -y @opencode/cli@latest";
  };

  config.xdg.configFile."opencode/opencode.jsonc".source = ./opencode.jsonc;
  config.xdg.configFile."opencode/cli.json".source = ./cli.json;
}
