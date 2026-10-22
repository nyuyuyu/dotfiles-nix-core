{
  config,
  lib,
  pkgsUnstable,
  ...
}:

{
  config.home.packages = [
    pkgsUnstable.nono
  ];
}
