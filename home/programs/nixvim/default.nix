{ pkgs, lib, ... }:
{
  imports = [ ./config ];

  programs.nixvim = {
    enable = true;
    enableMan = true;
    colorscheme = lib.mkForce null;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins.web-devicons.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      eldritch
      everforest-lua
      telescope-live-grep-args-nvim
      markdown
      blink-cmp-copilot
    ];
  };
}
