{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "ms-vscode-remote.remote-ssh"
          "ms-vscode-remote.vscode-remote-extensionpack"
        ];

        userSettings = {
          "remote.SSH.defaultExtensions" = [
            "github.copilot"
            "github.copilot-chat"
            "hverlin.mise-vscode"
            "mosapride.zenkaku"
            "MS-CEINTL.vscode-language-pack-ja"
          ];
        };
      };
    };
  };
}
