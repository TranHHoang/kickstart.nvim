return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      -- map({ 'n', 'v' }, ']c', function()
      --   if vim.wo.diff then
      --     return ']c'
      --   end
      --   vim.schedule(function()
      --     gs.next_hunk()
      --   end)
      --   return '<Ignore>'
      -- end, { expr = true, desc = 'Jump to next hunk' })
      --
      -- map({ 'n', 'v' }, '[c', function()
      --   if vim.wo.diff then
      --     return '[c'
      --   end
      --   vim.schedule(function()
      --     gs.prev_hunk()
      --   end)
      --   return '<Ignore>'
      -- end, { expr = true, desc = 'Jump to previous hunk' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[G]it [S]tage hunk' })
      map('v', '<leader>gr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[G]it [R]reset hunk' })
      -- normal mode
      map('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = '[G]it [B]ranches' })
      map('n', '<leader>gc', require('telescope.builtin').git_bcommits, { desc = '[G]it [C]ommits' })
      map('n', '<leader>gt', require('telescope.builtin').git_status, { desc = '[G]it S[t]atus' })
      map('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it [R]eset hunk' })
      -- map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
      -- map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
      -- map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
      map('n', '<leader>gs', gs.stage_hunk, { desc = '[G]it [S]tage hunk' })
      map('n', '<leader>gp', gs.preview_hunk, { desc = '[G]it [P]review hunk' })
      map('n', '<leader>gb', function()
        gs.blame_line { full = false }
      end, { desc = '[B]lame line' })
      map('n', '<leader>gd', gs.diffthis, { desc = '[G]it [D]iff against index' })
      -- map('n', '<leader>hD', function()
      --   gs.diffthis '~'
      -- end, { desc = 'git diff against last commit' })

      -- Toggles
      -- map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
      -- map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

      -- Text object
      -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
    end,
  },
}
