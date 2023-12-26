return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = { "BufReadPre", "BufNewFile" },
  ft = { "typescript", "typescriptreact", "javascript" },
  opts = {
    single_file_support = true,
  },
}
