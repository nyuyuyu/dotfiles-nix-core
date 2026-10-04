{ pkgs, ... }:

{
  # Dependencies
  imports = [
    ../fzf
    ../ghq
  ];

  config.home.sessionVariables = {
    GHQ_SELECTOR = "fzf";
    GHQ_SELECTOR_OPTS = "--prompt=Repos> ";
  };

  config.programs.fish = {
    plugins = [
      {
        name = "ghq";
        src = pkgs.fetchFromGitHub {
          owner = "decors";
          repo = "fish-ghq";
          rev = "cafaaab";
          sha256 = "sha256-6b1zmjtemNLNPx4qsXtm27AbtjwIZWkzJAo21/aVZzM=";
        };
      }
    ];
  };
}
