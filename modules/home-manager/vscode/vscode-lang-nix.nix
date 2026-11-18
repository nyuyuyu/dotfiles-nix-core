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
          extensions = with pkgs.vscode-extensions; [
            "jnoortheen.nix-ide"
          ];

          userSettings = {
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nil";
            "nil" = {
              "formatting" = {
                "command" = [
                  "nix"
                  "fmt"
                ];
              };
            };
          };
        };
      };
    };
  };
}
