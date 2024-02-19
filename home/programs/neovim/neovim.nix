{ ... }:

{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      flavour = "latte";
      transparentBackground = true;
    };

    plugins = {
      # https://github.com/nvim-lualine/lualine.nvim
      lualine.enable = true;

      # https://tree-sitter.github.io/tree-sitter/
      treesitter = { enable = true; };

      # https://github.com/nvim-telescope/telescope.nvim
      telescope = { enable = true; };

      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;

          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources =
          [ { name = "nvim_lsp"; } { name = "path"; } { name = "buffer"; } ];
      };
    };

    globals.mapleader = " ";
    keymaps = [{
      key = ";";
      action = ":";
    }];
  };

  imports = map (x: ./plugins + x) [ /telescope.nix ];
}
