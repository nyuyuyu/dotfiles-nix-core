{ config, ... }:

{
  # Dependencies
  imports = [
    ../fish
  ];

  config.programs.tmux = {
    enable = true;

    keyMode = "vi";
    mouse = true;
    prefix = "C-t";

    extraConfig = ''
      set -g default-command "fish -i"

      set -g default-terminal "tmux-256color"
      set -sa terminal-features ',*:RGB'

      unbind ]
      bind ] choose-buffer -F '#{=60:buffer_sample}'

      unbind |
      bind | split-window -v

      unbind Space
      bind Space choose-window

      unbind Tab
      bind Tab select-pane -t:.+

      unbind k
      bind k confirm-before "kill-window"

      unbind r
      bind r source-file "${config.xdg.configHome}/tmux/tmux.conf" \; display-message 'Reload config file.'

      unbind S
      bind S split-window -h

      unbind C-c
      bind C-c new-window

      unbind C-h
      bind ^h select-layout even-horizontal

      unbind C-n
      bind ^n switch-client -n

      unbind C-p
      bind ^p switch-client -p

      unbind C-x
      bind ^x set-window-option synchronize-panes

      unbind C-t
      bind C-t last-window

      unbind C-v
      bind ^v select-layout even-vertical
    '';
  };
}
