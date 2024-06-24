{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      settings = {
        pickers = {
          find_files = {
            hidden = true;
          };
        };
      };
      extensions = {
        frecency.enable = true;
        undo.enable = true;
      };
      keymaps = {
        "<leader>ff" = {
          mode = "n";
          action = "find_files";
          options = {
            desc = "[F]ind [F]iles";
          };
        };
        "<leader>fh" = {
          mode = "n";
          action = "help_tags";
          options = {
            desc = "[F]ind [H]elp";
          };
        };
        "<leader>fk" = {
          mode = "n";
          action = "keymaps";
          options = {
            desc = "[F]ind [K]eymaps";
          };
        };
        "<leader>fr" = {
          mode = "n";
          action = "resume";
          options = {
            desc = "[F]ind [R]esume";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fg";
        action.__raw = "require('telescope').extensions.live_grep_args.live_grep_args";
        options = {
          desc = "[F]ind by [G]rep";
        };
      }
      {
        mode = "n";
        key = "<leader>fu";
        action = "<cmd>Telescope undo<CR>";
        options = {
          desc = "[F]ind [U]ndo";
        };
      }
      {
        mode = "n";
        key = "<leader><leader>";
        action = "<cmd>Telescope frecency workspace=CWD<CR>";
        options = {
          desc = "Find by frecency";
        };
      }
    ];
  };
}
