return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      ---@class snacks.explorer.Config
      explorer = {
        replace_netrw = true,
      },
      indent = { enabled = false },
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
          files = {
            hidden = true,
          },
        },
      },
      zen = {
        toggles = {
          dim = false,
        },
      },
    },
    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>Z",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },
      {
        "<leader><space>",
        false,
      },
    },
  },
}
