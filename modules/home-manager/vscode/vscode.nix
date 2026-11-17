{
  pkgs,
  ...
}:

{
  # Dependencies
  imports = [
    ../fish
    ../udev-gothic
  ];

  config.programs.vscode = {
    enable = true;

    package = pkgs.vscode.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        rm -rf "$out/Applications/Visual Studio Code.app/Contents/Resources/app/node-compile-cache"
      '';
    });

    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "mosapride.zenkaku"
          "ms-ceintl.vscode-language-pack-ja"
        ];

        userSettings = {
          "editor.bracketPairColorization.enabled" = true;
          "editor.detectIndentation" = true;
          "editor.fontFamily" = "'UDEV Gothic LG', 'UDEV Gothic', Menlo, Monaco, 'Courier New', monospace";
          "editor.fontLigatures" = true;
          "editor.fontSize" = 12;
          "editor.formatOnSave" = false;
          "editor.guides.bracketPairs" = "active";
          "editor.insertSpaces" = true;
          "editor.minimap.enabled" = false;
          "editor.snippetSuggestions" = "top";
          "editor.tabCompletion" = "on";
          "editor.tabSize" = 4;

          "extensions.ignoreRecommendations" = true;

          "files.insertFinalNewline" = true;
          "files.trimTrailingWhitespace" = true;
          "files.watcherExclude" = {
            "**" = true;
          };

          "git.countBadge" = "tracked";
          "git.openRepositoryInParentFolders" = "never";

          "telemetry.telemetryLevel" = "off";

          "terminal.integrated.defaultProfile.linux" = "fish";
          "terminal.integrated.defaultProfile.osx" = "fish";
          "terminal.integrated.initialHint" = false;
          "terminal.integrated.stickyScroll.enabled" = false;

          "workbench.editor.enablePreview" = false;
          "workbench.fontAliasing" = "auto";
          "workbench.layoutControl.enabled" = false;
          "workbench.list.defaultFindMode" = "filter";
          "workbench.startupEditor" = "none";
          "workbench.tree.indent" = 14;
          "workbench.tree.renderIndentGuides" = "always";

          "window.menuBarVisibility" = "toggle";
          "window.openWithoutArgumentsInNewWindow" = "on";
          "window.restoreWindows" = "none";
        };
      };
    };
  };
}
