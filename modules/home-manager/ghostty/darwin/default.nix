{ ... }:

{
  imports = [
    ./ghostty-app-bundle.nix
  ];

  config.programs.ghostty = {
    settings = {
      macos-option-as-alt = true;
      macos-titlebar-style = "hidden";
      quit-after-last-window-closed = true;
    };
  };
}
