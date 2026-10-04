{
  config,
  lib,
  pkgs,
  ...
}:

let
  logDir = "${config.home.homeDirectory}/var/log/console";
in
{
  config.home.activation = {
    createLogDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD mkdir -p ${logDir}
    '';
  };

  config.programs.tmux = {
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.logging;
        extraConfig = ''
          set -g @logging_key 'h'
          set -g @logging-path "${logDir}"
          set -g @logging-filename "$(date +'%Y%m%d-%H%M%S').$(echo $$).log"
        '';
      }
    ];
  };
}
