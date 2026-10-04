{ ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        userSettings = {
          "[makefile]" = {
            "editor.insertSpaces" = false;
          };
        };
      };
    };
  };
}
