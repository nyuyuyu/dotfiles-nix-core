{ ... }:

{
  config = {
    home.sessionVariables = {
      PAGER = "less";
    };

    programs.less = {
      enable = true;
    };
  };
}
