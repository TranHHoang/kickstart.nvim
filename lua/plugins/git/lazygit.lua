return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open Lazy[G]it" },
  }
}
