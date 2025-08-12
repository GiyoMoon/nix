{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      settings = {
        defaults = {
          file_ignore_patterns = [ "^.git/" ];
        };
        pickers = {
          find_files = {
            hidden = true;
          };
          live_grep = {
            additional_args.__raw = ''
              function(_)
                return { "--hidden" }
              end
            '';
          };
        };
      };
      extensions = {
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
        "<leader>fg" = {
          mode = "n";
          action = "live_grep";
          options = {
            desc = "[F]ind by [G]rep";
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
        key = "<leader>fu";
        action = "<cmd>Telescope undo<CR>";
        options = {
          desc = "[F]ind [U]ndo";
        };
      }
      {
        mode = "n";
        key = "<leader>fl";
        action = "<cmd>Telescope lsp_references<CR>";
        options = {
          desc = "[F]ind [L]sp References";
        };
      }
    ];
  };
}
