return {
  "nvim-lualine/lualine.nvim",

  opts = function(_, opts)
    local trouble = require("trouble")
    local symbols = trouble.statusline
      and trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
      })

    local winbar_filetype = {
      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = { left = 3, right = 1 },
        color = { bg = "none" },
      },

      {
        LazyVim.lualine.pretty_path(),
        color = { bg = "none", gui = "bold" },
      },
    }

    table.insert(winbar_filetype, {
      symbols and symbols.get,
      cond = symbols and symbols.has,
    })

    opts.winbar = { lualine_c = winbar_filetype }
    opts.inactive_winbar = { lualine_c = winbar_filetype }
  end,
}
