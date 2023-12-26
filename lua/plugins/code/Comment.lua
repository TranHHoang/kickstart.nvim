return {
  'numToStr/Comment.nvim',
  opts = {},
  keys = {
    { '<C-_>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>',                 mode = { 'n', 'i' }, desc = 'Toggle comment' },
    { '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', mode = 'x',          desc = 'Toggle comment' },
  }
}
