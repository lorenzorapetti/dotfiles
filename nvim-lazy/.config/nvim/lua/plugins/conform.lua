return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      ruby = { "rubocop", "standardrb" },
    },
    formatters = {
      biome = {
        condition = function(ctx)
          return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      rubocop = {
        condition = function()
          return not vim.g.rubocop_disable and not vim.g.standardrb_enable
        end,
      },
      standardrb = {
        condition = function()
          return vim.g.standardrb_enable
        end,
      },
    },
  },
}
