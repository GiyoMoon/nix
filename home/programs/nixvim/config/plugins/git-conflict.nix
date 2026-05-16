{ lib, ... }:
{
  programs.nixvim = {
    plugins.git-conflict.enable = true;
    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "git-conflict.nvim"
      ];
  };
}
