local lsp = vim.g.lazyvim_ruby_lsp or "ruby_lsp"

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rubocop = {
        enabled = lsp == "rubocop",
      },
      standardrb = {
        enabled = lsp == "standardrb",
      },
    },
  },
}
