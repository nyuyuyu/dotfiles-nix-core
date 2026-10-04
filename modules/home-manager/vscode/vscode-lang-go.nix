{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "golang.go"
          "tamasfe.even-better-toml"
        ];

        userSettings = {
          "[go]" = {
            "editor.defaultFormatter" = "golang.go";
            "editor.insertSpaces" = false;
          };
          "go.lintOnSave" = "package";
          "go.toolsManagement.checkForUpdates" = "off";
          "go.useLanguageServer" = true;
        };
      };
    };
  };
}
