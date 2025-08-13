return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      yaml = { "yamllint" },
    },
    linters = {
      yamllint = {
        condition = function(ctx)
          return vim.fs.find({ ".yamllint", ".yamllint.yml", ".yamllint.yaml" }, { path = ctx.filename, upward = true })
        end,
      },
    },
  },
}
