let
  action_section = "──────────────Actions──────────────";
in
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      modules = {
        statusline = {
          use_icons = true;
        };
        starter = {
          header = ''
              /\ \▔\___  ___/\   /(●)_ __ ___  
             /  \/ / _ \/ _ \ \ / / | '_ ` _ \ 
            / /\  /  __/ (_) \ V /| | | | | | |
            \_\ \/ \___|\___/ \_/ |_|_| |_| |_|
            ───────────────────────────────────
          '';
          footer = "";
          content_hooks = {
            "__unkeyed.adding_bullet".__raw = "require('mini.starter').gen_hook.adding_bullet('» ')";
            "__unkeyed.aligning".__raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
          };
          items = [
            {
              action = "Telescope find_files";
              name = "F: Find Files";
              section = action_section;
            }
            {
              action = "Oil";
              name = "O: Oil";
              section = action_section;
            }
            {
              action = "DiffviewOpen";
              name = "D: Diffview";
              section = action_section;
            }
            {
              action = "qall!";
              name = "Q: Quit Neovim";
              section = action_section;
            }
          ];
        };
        clue = {
          triggers = [
            {
              mode = "n";
              keys = "<leader>";
            }
            {
              mode = "x";
              keys = "<leader>";
            }
            {
              mode = "i";
              keys = "<C-x>";
            }
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }
            {
              mode = "n";
              keys = "\"";
            }
            {
              mode = "x";
              keys = "\"";
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }
            {
              mode = "n";
              keys = "<C-w>";
            }
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
            }
          ];
          clues = [
            { __raw = "require('mini.clue').gen_clues.builtin_completion()"; }
            { __raw = "require('mini.clue').gen_clues.g()"; }
            { __raw = "require('mini.clue').gen_clues.marks()"; }
            { __raw = "require('mini.clue').gen_clues.registers()"; }
            { __raw = "require('mini.clue').gen_clues.windows()"; }
            { __raw = "require('mini.clue').gen_clues.z()"; }
          ];
        };
        hipatterns = {
          highlighters = {
            hex_color.__raw = "require('mini.hipatterns').gen_highlighter.hex_color()";
          };
        };
        surround = { };
        splitjoin = { };
        ai = { };
      };
    };
    extraConfigLua = builtins.readFile ../lua/mini.statusline.lua;
  };
}
