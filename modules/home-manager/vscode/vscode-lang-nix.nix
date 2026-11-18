{
  pkgs,
  ...
}:

{
  config = {
    home = {
      # Dependencies
      packages = [
        pkgs.nil
      ];
    };

    programs.vscode = {
      profiles = {
        default = {
          extensions = pkgs.nix4vscode.forVscode [
            "jnoortheen.nix-ide"
          ];

          userSettings = {
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nil";
          };
        };
      };
    };
  };
}
