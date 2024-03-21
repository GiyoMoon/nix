require('everforest').setup({
  background = 'hard',
  on_highlights = function(hl, p)
    hl.TelescopeBorder = { bg = p.bg0, fg = p.bg0 }
    hl.TelescopeTitle = { bg = p.bg0, fg = p.bg0 }
    hl.TelescopePreviewTitle = { bg = p.bg1, fg = p.none }
    hl.TelescopePreviewNormal = { bg = p.bg1 }
    hl.TelescopePreviewBorder = { bg = p.bg1, fg = p.bg1 }
    hl.TelescopePromptTitle = { bg = p.aqua, fg = p.none }
    hl.TelescopePromptBorder = { bg = p.bg2, fg = p.bg2 }
    hl.TelescopePromptNormal = { bg = p.bg2, fg = p.fg }
    hl.TelescopePromptCounter = { fg = p.bg0 }
  end,
})
