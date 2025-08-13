return {
  {
    "dmtrKovalenko/fff.nvim",
    build = "cargo build --release",
    opts = {
      keymaps = {
        move_up = { "<Up>", "<C-p>", "<C-k>" },
        move_down = { "<Down>", "<C-n>", "<C-j>" },
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          require("fff").find_files()
        end,
        desc = "Toggle FFF",
      },
    },
  },
}
