{ pkgs, ... }:

{
  config.programs.tmux = {
    plugins = [
      pkgs.tmuxPlugins.sensible
    ];
  };
}
