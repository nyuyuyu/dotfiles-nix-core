{ ... }:

{
  config.home = {
    file = {
      ".vimrc" = {
        source = ./.vimrc;
      };
    };

    shellAliases = {
      vi = "vim";
    };
  };

  config.programs.vim = {
    enable = true;

    defaultEditor = true;
  };
}
