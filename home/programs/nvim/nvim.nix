{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      conform-nvim
      copilot-lua
      diffview-nvim
      flash-nvim
      gitsigns-nvim
      harpoon
      mini-nvim
      noice-nvim
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-ts-autotag
      nvim-web-devicons
      oil-nvim
      telescope-nvim
      vim-sleuth

      # themes
      catppuccin-nvim
      everforest-nvim
      tokyonight-nvim

      # lsp/cmp
      nvim-cmp
      nvim-lspconfig
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp-tailwind-colors

      # snippets
      cmp_luasnip
      luasnip

      # noice deps
      nui-nvim
      nvim-notify

      # telescope deps
      plenary-nvim
      telescope-frecency-nvim
      telescope-undo-nvim
    ];
    extraConfig = ":luafile ~/.nix/home/programs/nvim/lua/init.lua";
  };
}
