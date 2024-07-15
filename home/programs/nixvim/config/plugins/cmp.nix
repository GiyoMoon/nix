{
  programs.nixvim.plugins = {
    luasnip.enable = true;
    cmp = {
      enable = true;
      settings = {
        snippet.expand.__raw = # lua
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        formatting.format.__raw = "require('cmp-tailwind-colors').format";
      };
    };
  };
}
