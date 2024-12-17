{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap.preset = "enter";
      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 0;
        };
        list = {
          selection = "auto_insert";
        };
        menu = {
          draw = {
            gap = 2;
            treesitter = true;
            columns = [
              {
                __unkeyed-1 = "label";
                __unkeyed-2 = "label_description";
                gap = 1;
              }
              {
                __unkeyed-1 = "kind_icon";
                __unkeyed-2 = "kind";
                gap = 1;
              }
            ];
            components = {
              label = {
                width = {
                  fill = true;
                };
              };
              "kind_icon" = {
                width = {
                  fill = true;
                };
              };
            };
          };
        };
      };
      sources = {
        # Future release
        # default = [
        #   "lsp"
        #   "path"
        #   "snippets"
        #   "buffer"
        #   "copilot"
        # ];
        completion.enabled_providers = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "copilot"
        ];
        providers = {
          copilot = {
            name = "copilot";
            module = "blink-cmp-copilot";
            transform_items.__raw = # lua
              ''
                function(_, items)
                  local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                  local kind_idx = #CompletionItemKind + 1
                  CompletionItemKind[kind_idx] = "Copilot"
                  for _, item in ipairs(items) do
                    item.kind = kind_idx
                  end
                  return items
                end
              '';
            score_offset = 100;
            async = true;
          };
        };
      };
      appearance = {
        kind_icons = {
          Copilot = "";
          Text = "󰉿";
          Method = "󰊕";
          Function = "󰊕";
          Constructor = "󰒓";

          Field = "󰜢";
          Variable = "󰆦";
          Property = "󰖷";

          Class = "󱡠";
          Interface = "󱡠";
          Struct = "󱡠";
          Module = "󰅩";

          Unit = "󰪚";
          Value = "󰦨";
          Enum = "󰦨";
          EnumMember = "󰦨";

          Keyword = "󰻾";
          Constant = "󰏿";

          Snippet = "󱄽";
          Color = "󰏘";
          File = "󰈔";
          Reference = "󰬲";
          Folder = "󰉋";
          Event = "󱐋";
          Operator = "󰪚";
          TypeParameter = "󰬛";
        };
      };
    };
  };
}
