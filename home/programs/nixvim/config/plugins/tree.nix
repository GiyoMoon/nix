{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      settings = {
        view = {
          side = "right";
        };
        git = {
          enable = false;
        };
        update_focused_file = {
          enable = true;
        };
        filters = {
          dotfiles = false;
          custom = [
            ".gd.uid$"
            ".DS_Store"
          ];
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          desc = "Nvim-tree [T]oggle";
        };
      }
    ];
  };
}
