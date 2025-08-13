return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<esc>"] = { "actions.close", mode = "n" },
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 0.8,
        max_height = 0.8,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      {
        "-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Toggle Oil",
      },
      {
        "<leader>fo",
        function()
          require("oil").toggle_float()
        end,
        desc = "Toggle Oil",
      },
      {
        "<leader>fO",
        function()
          require("oil").open()
        end,
        desc = "Open Oil",
      },
    },
  },
}
