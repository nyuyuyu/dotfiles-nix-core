{
  pkgs,
  ...
}:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "jnoortheen.nix-ide"
        ];

        userSettings = {
          "nix.formatterPath" = [
            "nix"
            "fmt"
            "{file}"
          ];
        };
      };
    };
  };
}
