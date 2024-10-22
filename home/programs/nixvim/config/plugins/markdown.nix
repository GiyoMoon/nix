{
  programs.nixvim.extraConfigLua = # lua
    ''
      require('render-markdown').setup({ latex = { enabled = false } })
    '';
}
