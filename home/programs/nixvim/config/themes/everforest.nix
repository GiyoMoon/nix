{
  programs.nixvim.extraConfigLua = # lua
    ''
      require('everforest').setup()
    '';
}
