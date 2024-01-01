return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { { "stylua" } },
      javascript = { { "eslint", "prettierd" } },
      typescript = { { "eslint", "prettierd" } },
      typescriptreact = { { "eslint", "prettierd" } },
    },
    format_on_save = {
      timeout_ns = 500,
      lsp_fallback = true,
    },
  },
}
