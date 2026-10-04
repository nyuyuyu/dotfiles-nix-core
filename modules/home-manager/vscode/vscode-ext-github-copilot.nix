{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "GitHub.copilot"
          "GitHub.copilot-chat"
        ];

        userSettings = {
          "github.copilot.chat.localeOverride" = "ja";
          "github.copilot.enable" = {
            "*" = false;
            plaintext = false;
            markdown = false;
            scminput = false;
          };

          "workbench.secondarySideBar.defaultVisibility" = "hidden";
        };
      };
    };
  };
}
