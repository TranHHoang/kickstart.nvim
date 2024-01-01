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
      lualine_c = { { 'filename', path = 1 }, },
      --   -- lualine_x = { { 'datetime', style = '%H:%M' } }
    }
  },
}
