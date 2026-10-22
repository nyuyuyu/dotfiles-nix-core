{ ... }:

{
  config = {
    home = {
      file = {
        ".vimrc" = {
          source = ./.vimrc;
        };
      };

      shellAliases = {
        vi = "vim";
      };
    };

    programs.vim = {
      enable = true;

      defaultEditor = true;
    };
  };
}
