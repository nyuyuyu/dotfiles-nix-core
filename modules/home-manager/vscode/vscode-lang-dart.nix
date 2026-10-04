{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "Dart-Code.dart-code"
          "Dart-Code.flutter"
        ];

        userSettings = {
          "[dart]" = {
            "editor.defaultFormatter" = "Dart-Code.dart-code";
          };
          "dart.renameFilesWithClasses" = "prompt";
          "dart.checkForSdkUpdates" = false;
        };
      };
    };
  };
}
