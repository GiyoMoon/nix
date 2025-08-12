{
  programs.nixvim.extraConfigLua = ''
    require('everforest').setup()
  '';
}
