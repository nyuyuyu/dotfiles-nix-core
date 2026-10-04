{ lib, pkgs, ... }:

{
  config.home = {
    # Dependencies
    packages = [
      pkgs.curl
    ];

    activation = {
      miseInitialSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        export PATH="${lib.makeBinPath [ pkgs.curl ]}:$PATH"
        $DRY_RUN_CMD ${pkgs.mise}/bin/mise install -v
      '';
    };
  };

  config.programs.mise = {
    enable = true;

    globalConfig = {
      settings = {
        idiomatic_version_file_enable_tools = [
          "go"
          "node"
          "python"
          "ruby"
        ];
      };
    };
  };
}
