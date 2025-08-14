-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

Snacks.toggle({
  name = "Copilot Suggestions (Buffer)",
  get = function()
    return not vim.b.copilot_suggestion_hidden
  end,
  set = function(value)
    vim.b.copilot_suggestion_hidden = not value
  end,
}):map("<leader>uA")

Snacks.toggle({
  name = "Copilot Suggestions",
  get = function()
    return not require("copilot.client").is_disabled()
  end,
  set = function(value)
    local c = require("copilot.command")
    if value then
      c.enable()
    else
      c.disable()
    end
  end,
}):map("<leader>ua")

vim.keymap.set("n", "<C-;>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>qb", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<c-/>")
vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal(nil, {
    cwd = LazyVim.root(),
    win = {
      minimal = true,
      wo = {
        cursorcolumn = false,
        cursorline = false,
        cursorlineopt = "both",
        colorcolumn = "",
        fillchars = "eob: ,lastline:…",
        list = false,
        listchars = "extends:…,tab:  ",
        number = false,
        relativenumber = false,
        signcolumn = "no",
        spell = false,
        winbar = "",
        statuscolumn = "",
        wrap = false,
        sidescrolloff = 0,
      },
    },
  })
end, { desc = "Toggle Floating Terminal" })
