return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { "cn", "cva" },
          },
        },
      },
      -- rubocop = {
      --   enabled = lsp == "rubocop",
      -- },
      -- standardrb = {
      --   enabled = lsp == "standardrb",
      -- },
    },
  },
}
