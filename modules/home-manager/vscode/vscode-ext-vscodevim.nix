{ pkgs, ... }:

{
  config.programs.vscode = {
    profiles = {
      default = {
        extensions = pkgs.nix4vscode.forVscode [
          "vscodevim.vim"
        ];

        userSettings = {
          "vim.easymotion" = true;
          "vim.foldfix" = true;
          "vim.hlsearch" = true;
          "vim.ignorecase" = true;
          "vim.incsearch" = true;
          "vim.leader" = "<space>";
          "vim.useCtrlKeys" = true;
          "vim.visualstar" = true;
        };
      };
    };
  };
}
