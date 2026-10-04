{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "oderwat.indent-rainbow"
        ];
      };
    };
  };
}
