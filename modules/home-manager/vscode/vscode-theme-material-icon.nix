{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "pkief.material-icon-theme"
        ];

        userSettings = {
          "workbench.iconTheme" = "material-icon-theme";
        };
      };
    };
  };
}
