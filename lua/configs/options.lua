-- Colorscheme
vim.cmd.colorscheme('catppuccin')

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
local opt = vim.opt

-- Set highlight on search
opt.hlsearch = false

-- Make line numbers default
opt.number = true
-- Relative line numbers
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = 'a'
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'
-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- trigger indent after we write "case", and when we backspace.
opt.smartindent = true

-- No statusline
opt.laststatus = 3
opt.showmode = false

-- No wrap
opt.wrap = false

-- Setup GUI font
opt.guifont = 'FantasqueSansM Nerd Font:h13'
