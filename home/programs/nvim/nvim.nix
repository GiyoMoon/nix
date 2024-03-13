{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      conform-nvim
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
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-cmdline
      cmp-path
      cmp-tailwind-colors

      # snippets
      luasnip
      cmp_luasnip

      # noice deps
      nui-nvim
      nvim-notify

      # telescope deps
      telescope-frecency-nvim
      plenary-nvim
    ];
    extraConfig = ":luafile ~/.nix/home/programs/nvim/lua/init.lua";
  };
}
