{
  programs.nixvim = {
    autoCmd = [
      {
        desc = "Highlight on yank";
        event = [ "TextYankPost" ];
        callback.__raw = # lua
          ''
            function()
              vim.highlight.on_yank()
            end
          '';
      }
      {
        desc = "Remove kitty padding on enter";
        event = [ "VimEnter" ];
        command = ":silent !kitty @ set-spacing padding=0";
      }
      {
        desc = "Restore kitty padding on leave";
        event = [ "VimLeave" ];
        command = ":silent !kitty @ set-spacing padding=default";
      }
    ];
  };
}
