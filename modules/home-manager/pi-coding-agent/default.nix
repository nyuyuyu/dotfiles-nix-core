{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

{
  config = {
    home.packages = [
      inputs.pi.packages.${pkgs.stdenv.hostPlatform.system}.default
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
