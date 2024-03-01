{ ... }:

let
  kickstart = builtins.readFile ./kickstart.lua;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = kickstart;
  };
}
