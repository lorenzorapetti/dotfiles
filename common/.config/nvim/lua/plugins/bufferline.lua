return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
    keys = {
      { "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    },
    opts = function(_, opts)
      if package.loaded["catppuccin"] then
        local theme = require("catppuccin.palettes").get_palette()
        local active_bg = theme.base
        local inactive_bg = theme.mantle

        opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
          styles = { "italic", "bold" },
          custom = {
            all = {
              fill = { bg = inactive_bg },
              background = { bg = inactive_bg },
              buffer_visible = { bg = inactive_bg },
              buffer_selected = { bg = active_bg },
              duplicate_selected = { bg = active_bg },
              duplicate_visible = { bg = inactive_bg },
              duplicate = { bg = inactive_bg },
              tab = { bg = inactive_bg },
              tab_selected = { bg = active_bg },
              tab_separator = { bg = inactive_bg },
              tab_separator_selected = { bg = active_bg },
              tab_close = { bg = inactive_bg },
              indicator_visible = { bg = inactive_bg },
              indicator_selected = { bg = active_bg },
              separator = { bg = inactive_bg },
              separator_visible = { bg = inactive_bg },
              separator_selected = { bg = active_bg },
              offset_separator = { bg = active_bg },
              close_button = { bg = inactive_bg },
              close_button_visible = { bg = inactive_bg },
              close_button_selected = { bg = active_bg },
              numbers = { bg = inactive_bg },
              numbers_visible = { bg = inactive_bg },
              numbers_selected = { bg = active_bg },
              error = { bg = inactive_bg },
              error_visible = { bg = inactive_bg },
              error_selected = { bg = active_bg },
              error_diagnostic = { bg = inactive_bg },
              error_diagnostic_visible = { bg = inactive_bg },
              error_diagnostic_selected = { bg = active_bg },
              warning = { bg = inactive_bg },
              warning_visible = { bg = inactive_bg },
              warning_selected = { bg = active_bg },
              warning_diagnostic = { bg = inactive_bg },
              warning_diagnostic_visible = { bg = inactive_bg },
              warning_diagnostic_selected = { bg = active_bg },
              info = { bg = inactive_bg },
              info_visible = { bg = inactive_bg },
              info_selected = { bg = active_bg },
              info_diagnostic = { bg = inactive_bg },
              info_diagnostic_visible = { bg = inactive_bg },
              info_diagnostic_selected = { bg = active_bg },
              hint = { bg = inactive_bg },
              hint_visible = { bg = inactive_bg },
              hint_selected = { bg = active_bg },
              hint_diagnostic = { bg = inactive_bg },
              hint_diagnostic_visible = { bg = inactive_bg },
              hint_diagnostic_selected = { bg = active_bg },
              diagnostic = { bg = inactive_bg },
              diagnostic_visible = { bg = inactive_bg },
              diagnostic_selected = { bg = active_bg },
              modified = { bg = inactive_bg },
              modified_visible = { bg = inactive_bg },
              modified_selected = { bg = active_bg },
            },
          },
        })
      end
    end,
  },
}
