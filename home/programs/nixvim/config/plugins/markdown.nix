{
  programs.nixvim.extraConfigLua = # lua
    ''
      require('render-markdown').setup()
    '';
}
