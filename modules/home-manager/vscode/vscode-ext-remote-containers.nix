{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../podman
  ];

  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "ms-vscode-remote.remote-containers"
          "ms-vscode-remote.vscode-remote-extensionpack"
        ];

        userSettings = {
          "dev.containers.defaultExtensions" = [
            "github.copilot"
            "github.copilot-chat"
            "mosapride.zenkaku"
            "MS-CEINTL.vscode-language-pack-ja"
          ];
          "dev.containers.dockerPath" = "podman";
        };
      };
    };
  };
}
