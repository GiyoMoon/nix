{
  programs.nixvim.plugins.flash.enable = true;
  programs.nixvim.keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = "require('flash').treesitter";
      options = {
        desc = "Flash Treesitter";
      };
    }
  ];
}
