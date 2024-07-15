{
  programs.nixvim.extraConfigLua = # lua
    ''
      require('eldritch').setup()
    '';
}
