{ ... }:

{
  config.home.shellAliases = {
    fd = "lf";
  };

  config.programs.lf = {
    enable = true;

    keybindings = {
      "<enter>" = "open";
      "<backspace>" = "updir";
      "<backspace2>" = "updir";
    };

    settings = {
      drawbox = true;
      number = true;
      promptfmt = ''❯ \033[34;1m%w/\033[0m\033[1m%f\033[0m'';
    };
  };
}
