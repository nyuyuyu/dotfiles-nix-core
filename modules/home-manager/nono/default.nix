{
  pkgsUnstable,
  ...
}:

{
  config.home.packages = [
    pkgsUnstable.nono
  ];
}
