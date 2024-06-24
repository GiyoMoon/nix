{
  programs.nixvim.extraConfigLua = ''
    require('eldritch').setup()
  '';
}
