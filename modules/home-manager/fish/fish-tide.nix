{ lib, pkgs, ... }:

{
  config.programs.fish = {
    interactiveShellInit = ''
      if not set -q tide_left_prompt_items
        tide configure \
          --auto \
          --style=Lean \
          --prompt_colors='True color' \
          --show_time=No \
          --lean_prompt_height='Two lines' \
          --prompt_connection=Disconnected \
          --prompt_connection_andor_frame_color=Lightest \
          --prompt_spacing=Compact \
          --icons='Few icons' \
          --transient=Yes
        set --universal tide_context_always_display false
      end
    '';

    plugins = with pkgs; [
      {
        name = fishPlugins.tide.pname;
        src = fishPlugins.tide.src;
      }
    ];
  };
}
