{
  config,
  lib,
  pkgs,
  ...
}:

let
  podman = pkgs.podman.override {
    extraPackages = [
      pkgs.qemu
      pkgs.virtiofsd
    ];
    extraRuntimes = [ pkgs.gvproxy ];
  };
in
{
  config = lib.mkIf pkgs.stdenv.isLinux {
    podman.machine.package = podman;

    systemd.user.services.podman-machine = {
      Unit = {
        Description = "Podman machine";
        After = [ "default.target" ];
      };

      Service = {
        Type = "oneshot";
        RemainAfterExit = true;
        TimeoutStartSec = 60;
        ExecStart = "-${podman}/bin/podman machine start";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
