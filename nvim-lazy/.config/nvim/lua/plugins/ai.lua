return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-CR>",
      },
    })

    local api = require("supermaven-nvim.api")

    vim.keymap.set("n", "<leader>uS", function()
      api.toggle()
    end, { desc = "Toggle Supermaven" })
  end,
}
