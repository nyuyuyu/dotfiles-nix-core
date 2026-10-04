{
  config,
  lib,
  pkgs,
  ...
}:

let
  moduleConfig = config.podman.machine;
in
{
  imports = [
    ./darwin
    ./linux
  ];

  options.podman.machine = {
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.podman;
      description = "Podman package used for machine lifecycle commands.";
    };
    cpus = lib.mkOption {
      type = lib.types.int;
      default = 2;
      description = "Number of CPUs for the podman machine.";
    };
    memory = lib.mkOption {
      type = lib.types.int;
      default = 2048;
      description = "Memory in MB for the podman machine.";
    };
    diskSize = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = "Disk size in GB for the podman machine.";
    };
  };

  config.home = {
    packages = [
      pkgs.podman
    ];

    file = {
      ".config/containers/containers.conf".source = ./containers.conf;
      ".config/containers/registries.conf".source = ./registries.conf;
    };

    activation = {
      initPodmanMachine = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        PODMAN="${moduleConfig.package}/bin/podman"
        if ! $PODMAN machine list --format "{{.Name}}" | grep -E -q "^podman-machine-default\*?$"; then
          $DRY_RUN_CMD $PODMAN machine init \
            --cpus ${toString moduleConfig.cpus} \
            --memory ${toString moduleConfig.memory} \
            --disk-size ${toString moduleConfig.diskSize}
        fi
      '';
    };

    shellAliases = {
      docker = "podman";
    };
  };
}
