{
  programs.nixvim.extraConfigLua = ''
    require('everforest').setup({
      background = 'dark'
    })
  '';
}
