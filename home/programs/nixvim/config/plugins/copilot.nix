{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
          keymap = {
            accept = "<C-c>";
            accept_word = false;
            accept_line = false;
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
        };
      };
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
