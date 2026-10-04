{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../pet
  ];

  config.programs.tmux = {
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.mkTmuxPlugin {
          pluginName = "pet";
          version = "1.0.0";
          src = fetchFromGitHub {
            owner = "nyuyuyu";
            repo = "tmux-pet";
            rev = "c90cfcf";
            hash = "sha256-gee0QjxAS21ESByZbp9c7uCHqX27oLfP7HTnnpHdsdM=";
          };
        };
        extraConfig = ''
          set -g @pet-vertical-split-pane-key 'C-s'
        '';
      }
    ];
  };
}
