{
  programs.nixvim.plugins.copilot-lua = {
    enable = true;
    suggestion = {
      enabled = true;
      autoTrigger = true;
      keymap = {
        accept = "<C-c>";
        acceptWord = false;
        acceptLine = false;
        next = "<M-]>";
        prev = "<M-[>";
        dismiss = "<C-]>";
      };
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ct";
      action = "require('copilot.suggestion').toggle_auto_trigger";
      options = {
        desc = "[C]opilot [T]oggle";
      };
    }
  ];
}
