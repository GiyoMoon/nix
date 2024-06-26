{
  programs.nixvim = {
    plugins.flash.enable = true;
    keymaps = [
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
  };
}
