return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    shading_factor = 0,
    direction = 'vertical'
  },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<C-k>",  "<Cmd>wincmd k<CR>",   mode = 't',              desc = "Move to top window" },
    { "<C-j>",  "<Cmd>wincmd j<CR>",   mode = 't',              desc = "Move to bottom window" },
    { "<C-h>",  "<Cmd>wincmd h<CR>",   mode = 't',              desc = "Move to left window" },
    { "<C-l>",  "<Cmd>wincmd l<CR>",   mode = 't',              desc = "Move to right window" },
    { "<Esc>",  "<C-\\><C-n>",         mode = 't',              desc = "Exit terminal mode" },
  },
}
