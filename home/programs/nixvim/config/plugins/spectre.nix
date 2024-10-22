{
  programs.nixvim = {
    plugins.spectre.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>s";
        action = ''<cmd>lua require("spectre").toggle()<CR>'';
        options = {
          desc = "[S]pectre Toggle";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>s";
        action = ''
          <esc><cmd>lua require("spectre").open_visual()<CR>
        '';
        options = {
          desc = "[S]pectre Current Word";
          silent = true;
        };
      }
    ];
  };
}
