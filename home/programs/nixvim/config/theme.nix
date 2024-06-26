{
  imports = [ ./themes ];
  programs.nixvim.extraConfigLua = builtins.readFile ./lua/theme.lua;
}
