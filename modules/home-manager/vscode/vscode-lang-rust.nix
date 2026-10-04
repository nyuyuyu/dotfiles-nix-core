{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "rust-lang.rust-analyzer"
          "vadimcn.vscode-lldb"
        ];

        userSettings = {
          "[rust]" = {
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
            "editor.inlayHints.enabled" = "on";
          };
          "rust-analyzer.check.command" = "clippy";
          "rust-analyzer.check.extraArgs" = [
            "--"
            "-D"
            "warnings"
          ];
          "rust-analyzer.checkOnSave" = true;
        };
      };
    };
  };
}
