local statusline = require('mini.statusline')
statusline.setup({
  use_icons = true,
})
statusline.active = function()
  local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
  local git = statusline.section_git({ trunc_width = 75 })
  local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
  local filename = statusline.section_filename()
  local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
  local search = statusline.section_searchcount({ trunc_width = 75 })

  return statusline.combine_groups({
    { hl = mode_hl, strings = { mode } },
    { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
    '%<', -- Mark general truncate point
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=', -- End left alignment
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
    { hl = mode_hl, strings = { search } },
  })
end

statusline.section_filename = function()
  return '%t%m'
end

statusline.section_fileinfo = function(args)
  local filetype = vim.bo.filetype
  if (filetype == '') or vim.bo.buftype ~= '' then
    return ''
  end
  local file_name, file_ext = vim.fn.expand('%:t'), vim.fn.expand('%:e')

  local devicons = require('nvim-web-devicons')
  local icon = devicons.get_icon(file_name, file_ext, { default = true })
  if icon ~= '' then
    filetype = string.format('%s %s', icon, filetype)
  end

  if statusline.is_truncated(args.trunc_width) then
    return filetype
  end
  return filetype
end

local starter = require('mini.starter')
starter.setup({
  content_hooks = {
    starter.gen_hook.adding_bullet('» '),
    starter.gen_hook.aligning('center', 'center'),
  },
  header = table.concat({
    [[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
    [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
    [[/ /\  /  __/ (_) \ V /| | | | | | |]],
    [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
    [[sillyyy───────────────────────────────────]],
  }, '\n'),
  footer = '──────────' .. os.date('%d.%m.%y  %H:%M') .. '──────────',
  items = {
    {
      action = 'Telescope frecency workspace=CWD',
      name = 'R: Recent',
      section = '──────────────Actions──────────────',
    },
    {
      action = 'Telescope find_files',
      name = 'F: Find Files',
      section = '──────────────Actions──────────────',
    },
    {
      action = 'enew',
      name = 'E: New Buffer',
      section = '──────────────Actions──────────────',
    },
    {
      action = 'qall!',
      name = 'Q: Quit Neovim',
      section = '──────────────Actions──────────────',
    },
  },
})
require('mini.comment').setup()

local clue = require('mini.clue')
clue.setup({
  triggers = {
    { mode = 'n', keys = '<leader>' },
    { mode = 'x', keys = '<leader>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' },
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
  clues = {
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    -- hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    -- todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    -- note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require('mini.surround').setup()
require('mini.splitjoin').setup()
