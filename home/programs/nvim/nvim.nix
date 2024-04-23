{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      conform-nvim
      copilot-lua
      debugprint-nvim
      diffview-nvim
      flash-nvim
      git-conflict-nvim
      gitsigns-nvim
      harpoon
      mini-nvim
      noice-nvim
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-ts-autotag
      nvim-ts-context-commentstring
      nvim-web-devicons
      oil-nvim
      telescope-nvim
      vim-sleuth

      # themes
      catppuccin-nvim
      everforest-nvim
      tokyonight-nvim
      eldritch-nvim
      rose-pine

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
      telescope-live-grep-args-nvim
    ];
    extraConfig = ":luafile ~/.nix/home/programs/nvim/lua/init.lua";
  };
}
