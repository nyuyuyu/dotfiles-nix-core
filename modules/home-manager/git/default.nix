{ ... }:

{
  config.programs.git = {
    enable = true;

    settings = {
      alias = {
        st = "status";
      };
      credential = {
        helper = "cache --timeout=43200";
      };
      fetch = {
        prune = true;
      };
      url = {
        "https://" = {
          insteadOf = "git://";
        };
      };
    };
  };
}
