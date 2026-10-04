{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "codezombiech.gitignore"
        ];

        userSettings = {
          "gitignore.cacheExpirationInterval" = 86400;
        };
      };
    };
  };
}
