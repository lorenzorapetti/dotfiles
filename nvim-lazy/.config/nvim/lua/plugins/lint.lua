return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      javascript = { "biomejs", "eslint_d" },
      javascriptreact = { "biomejs", "eslint_d" },
      typescript = { "biomejs", "eslint_d" },
      typescriptreact = { "biomejs", "eslint_d" },
    },
    linters = {
      biomejs = {
        condition = function(ctx)
          return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      eslint_d = {
        condition = function(ctx)
          return vim.fs.find({
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
            ".eslintrc.jsonc",
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
          }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
