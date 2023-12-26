-- [[ Basic Keymaps ]]
local mapkey = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
mapkey({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Dealing with word wrap
mapkey('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
mapkey('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

mapkey('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
mapkey('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
mapkey('n', '<C-k>', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- mapkey('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

mapkey('n', '|', '<Cmd>vsplit<Cr>', { desc = 'Split vertically' })
mapkey('n', '\\', '<Cmd>split<Cr>', { desc = 'Split horizontally' })
mapkey('n', ';', ':', { desc = 'Toggle command mode' })

-- Make <C-c> behave like <Esc>
mapkey('i', '<C-c>', '<Esc>')
mapkey('n', '<C-c>', '<Esc>')

-- Windows
mapkey('n', '<C-h>', '<C-w>h', { desc = 'Switch to left window' })
mapkey('n', '<C-j>', '<C-w>j', { desc = 'Switch to lower window' })
mapkey('n', '<C-k>', '<C-w>k', { desc = 'Switch to upper window' })
mapkey('n', '<C-l>', '<C-w>l', { desc = 'Switch to right window' })

-- Insert movement
mapkey('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
mapkey('i', '<C-j>', '<Down>', { desc = 'Move cursor down' })
mapkey('i', '<C-k>', '<Up>', { desc = 'Move cursor up' })
mapkey('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })
mapkey('i', '<C-a>', '<C-o>A', { desc = 'Move cursor to end of line' })
