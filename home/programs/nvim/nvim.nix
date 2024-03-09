{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      diffview-nvim
      flash-nvim
      gitsigns-nvim
      harpoon
      mini-nvim
      noice-nvim
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      oil-nvim
      telescope-nvim
      vim-sleuth
      conform-nvim

      # lsp
      nvim-lspconfig
      # completions
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-cmdline
      cmp-path
      cmp-tailwind-colors

      # snippets
      luasnip
      cmp_luasnip

      nvim-web-devicons
      # noice deps
      nui-nvim
      nvim-notify
      # telescope dep
      telescope-frecency-nvim
      plenary-nvim
    ];
    extraConfig = ":luafile ~/.nix/home/programs/nvim/lua/init.lua";
  };
}
