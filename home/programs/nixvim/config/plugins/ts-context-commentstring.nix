{
  programs.nixvim = {
    plugins.ts-context-commentstring.enable = true;
    extraConfigLua = # lua
      ''
        local get_option = vim.filetype.get_option
        vim.filetype.get_option = function(filetype, option)
          return option == "commentstring"
            and require("ts_context_commentstring.internal").calculate_commentstring()
            or get_option(filetype, option)
        end
      '';
  };
}
