{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../pet
  ];

  config.programs.fish = {
    binds = {
      "\\cs" = {
        # Ctrl + s
        command = "pet-select";
      };
    };

    plugins = [
      {
        name = "fish-pet";
        src = pkgs.fetchFromGitHub {
          owner = "melhakim";
          repo = "fish-pet";
          rev = "a08a5ee";
          sha256 = "sha256-/MK2TWDqYtGLnoWYexhG3IG20wsLxVV7LTHI/MyT1qI=";
        };
      }
    ];
  };
}
