{ ... }:

{
  config.programs.fzf = {
    enable = true;
    defaultOptions = [
      "--layout=reverse"
      "--border"
    ];
    enableFishIntegration = false;
  };
}
