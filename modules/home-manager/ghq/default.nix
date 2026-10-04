{ lib, pkgs, ... }:

let
  ghqDirs = [
    "~/sandbox"
    "~/ghq"
  ];
in

{
  config.home = {
    activation.createGhqRoot = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      lib.concatMapStrings (dir: ''
        $DRY_RUN_CMD mkdir -p ${dir}
      '') ghqDirs
    );

    packages = [
      pkgs.ghq
    ];
  };

  config.programs.git = {
    enable = true;

    settings = {
      ghq = {
        root = ghqDirs;
      };
    };
  };
}
