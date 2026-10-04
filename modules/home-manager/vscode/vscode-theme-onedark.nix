{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "akamud.vscode-theme-onedark"
        ];

        userSettings = {
          "editor.semanticTokenColorCustomizations" = {
            "[Atom One Dark]" = {
              enabled = true;
              rules = {
                "*.constant" = {
                  fontStyle = "italic bold";
                };
                "*.deprecated" = {
                  fontStyle = "strikethrough";
                };
                "*.mutable" = {
                  fontStyle = "underline";
                };
              };
            };
          };

          "workbench.colorTheme" = "Atom One Dark";
          "workbench.colorCustomizations" = {
            "activityBar.background" = "#20252C";
            "activityBar.foreground" = "#626C83";
            "activityBarBadge.background" = "#567";
            "badge.background" = "#20252C";
            "foreground" = "#999";
            "gitDecoration.ignoredResourceForeground" = "#5B6270";
            "sideBar.background" = "#20252C";
            "sideBarSectionHeader.background" = "#20252C";
            "statusBar.background" = "#20252C";
            "statusBar.debuggingBackground" = "#511f1f";
            "statusBar.noFolderBackground" = "#222225";
            "terminal.ansiBlue" = "#5DADF1";
            "terminal.ansiCyan" = "#51B6C3";
            "terminal.ansiGreen" = "#96C475";
            "terminal.ansiMagenta" = "#C774DF";
            "terminal.ansiRed" = "#E26B73";
            "terminal.ansiYellow" = "#E5C076";
            "terminal.foreground" = "#999";
            "tree.indentGuidesStroke" = "#225FA1";
          };
        };
      };
    };
  };
}
