{
  config,
  lib,
  pkgsUnstable,
  ...
}:

{
  config = {
    home.packages = [
      pkgsUnstable.pi-coding-agent
    ];

    # pi with tmux
    programs.tmux.extraConfig = lib.mkIf config.programs.tmux.enable (
      lib.mkAfter ''
        set -g extended-keys on
        set -g extended-keys-format csi-u
      ''
    );
  };
}
