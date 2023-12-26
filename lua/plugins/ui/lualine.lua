return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_c = { '%=', 'filename', 'encoding', 'fileformat', { 'filetype', icon_only = false, colored = true } },
      lualine_x = { { 'datetime', style = '%H:%M' } }
    }
  },
}
