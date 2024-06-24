{
  imports = [ ./themes ];
  programs.nixvim = {
    extraConfigLuaPost = builtins.readFile ./lua/theme.lua;
  };
}
