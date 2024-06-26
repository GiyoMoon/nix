{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        view_options = {
          show_hidden = true;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>Oil<CR>";
        options = {
          desc = "[O]il";
        };
      }
    ];
  };
}
