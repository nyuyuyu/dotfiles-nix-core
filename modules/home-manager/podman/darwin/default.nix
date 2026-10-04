{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf pkgs.stdenv.isDarwin {
    launchd.agents.podman = {
      enable = true;

      config = {
        AbandonProcessGroup = true;
        RunAtLoad = true;
        ProgramArguments = [
          "${pkgs.podman}/bin/podman"
          "machine"
          "start"
        ];
        StandardOutPath = "/tmp/podman.out.log";
        StandardErrorPath = "/tmp/podman.err.log";
        Timeout = 60;
      };
    };
  };
}
