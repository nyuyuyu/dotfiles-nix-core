{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../mise
  ];

  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "hverlin.mise-vscode"
        ];

        userSettings = {
          "mise.checkForNewMiseVersion" = false;
        };
      };
    };
  };
}
