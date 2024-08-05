return {
  "hrsh7th/nvim-cmp",
  keys = {
    { "<Tab>", false, mode = { "i", "s" } },
    { "<S-Tab>", false, mode = { "i", "s" } },
    {
      "<C-l>",
      function()
        return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<C-r>",
      function()
        return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  },
  opts = {
    mapping = {
      ["<CR>"] = vim.NIL,
    },
  },
}
