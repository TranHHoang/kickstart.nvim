-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  opts = function()
    return {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      extensions_list = { "fzf", "ui-select", "themes", "terms" },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
  end,
  keys = function()
    -- local function telescope_live_grep_open_files()
    --   require('telescope.builtin').live_grep {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep in Open Files',
    --   }
    -- end
    return {
      { '<leader>fo',    require('telescope.builtin').oldfiles,    desc = '[F]ind [O]pened files' },
      { '<leader>ff',    require('telescope.builtin').find_files,  desc = '[F]ind [F]iles' },
      { '<leader>fh',    require('telescope.builtin').help_tags,   desc = '[F]ind [H]elp' },
      { '<leader>fb',    require('telescope.builtin').buffers,     desc = '[F]ind [B]uffers' },
      { '<leader>fw',    require('telescope.builtin').live_grep,   desc = '[F]ind Live Grep' },
      { '<leader>fd',    require('telescope.builtin').diagnostics, desc = '[F]ind [D]iagnostics' },
      { '<leader>f<CR>', require('telescope.builtin').resume,      desc = '[F]ind Resume' },

      -- { '<leader>f/', require('telescope.builtin').current_buffer_fuzzy_find, desc = '[/] Fuzzily search in current buffer' },
      -- { '<leader>f/', telescope_live_grep_open_files, desc = '[S]earch [/] in Open Files' },
      -- { '<leader>gf', require('telescope.builtin').git_files, desc = 'Search [G]it [F]iles' },
    }
  end,
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    for _, ext in ipairs(opts.extensions_list) do
      pcall(telescope.load_extension, ext)
    end

    -- Setup colorscheme
    -- Highlight group
    local function setup_telescope_theme()
      local function get_hlgroup(name)
        local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
        if not hl.fg then hl.fg = "NONE" end
        if not hl.bg then hl.bg = "NONE" end
        return hl
      end

      local normal = get_hlgroup "Normal"
      local fg, bg = normal.fg, normal.bg
      local bg_alt = get_hlgroup("Visual").bg
      local green = get_hlgroup("String").fg
      local red = get_hlgroup("Error").fg

      local theme = {
        TelescopeBorder = { fg = bg_alt, bg = bg },
        TelescopeNormal = { bg = bg },
        TelescopePreviewBorder = { fg = bg, bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePreviewTitle = { fg = bg, bg = green },
        TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
        TelescopePromptNormal = { fg = fg, bg = bg_alt },
        TelescopePromptPrefix = { fg = red, bg = bg_alt },
        TelescopePromptTitle = { fg = bg, bg = red },
        TelescopeResultsBorder = { fg = bg, bg = bg },
        TelescopeResultsNormal = { bg = bg },
        TelescopeResultsTitle = { fg = bg, bg = bg },
      }

      for hl, col in pairs(theme) do
        vim.api.nvim_set_hl(0, hl, col)
      end
    end
    setup_telescope_theme()
  end,
}
