return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      yaml = { "yamllint" },
    },
    linters = {
      yamllint = {
        condition = function(ctx)
          return vim.fs.find({ ".yamllint", ".yamllint.yml", ".yamllint.yaml" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      eslint = {
        condition = function(ctx)
          return vim.fs.find({
            ".eslintrc",
            ".eslintrc.json",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.mjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            "eslint.config.js",
            "eslint.config.cjs",
            "eslint.config.mjs",
          }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
