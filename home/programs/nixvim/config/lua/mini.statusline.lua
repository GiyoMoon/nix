local statusline = require('mini.statusline')

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

statusline.inactive = function()
  local filename = statusline.section_filename()

  return statusline.combine_groups({
    { hl = 'MiniStatuslineFilename', strings = { filename } },
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
