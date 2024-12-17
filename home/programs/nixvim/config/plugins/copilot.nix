{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      suggestion.enabled = false;
      panel.enabled = false;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>ct";
        action = "require('copilot.suggestion').toggle_auto_trigger";
        options = {
          desc = "[C]opilot [T]oggle";
        };
      }
    ];
  };
}
