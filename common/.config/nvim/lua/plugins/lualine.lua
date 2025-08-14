return {
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Custom Lualine component to show attached language server
      local lsp_clients = function()
        local bufnr = vim.api.nvim_get_current_buf()

        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        if next(clients) == nil then
          return ""
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end
        return " " .. table.concat(c, " - ")
      end

      if package.loaded["catppuccin"] then
        local palette = require("catppuccin.palettes").get_palette("mocha")
        local theme = require("lualine.themes.catppuccin-mocha")
        theme.normal.c.bg = palette.mantle
        opts.options.theme = theme
      end

      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = " ", right = " " }
      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
          separator = { left = "", right = "" },
          icon = "",
        },
      }
      opts.sections.lualine_b = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", separator = "" },
      }
      opts.sections.lualine_c = {
        { "branch", icon = "" },
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
        },
      }
      opts.sections.lualine_x = {
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          update_in_insert = true,
        },
        { "harpoon2" },
        {
          function()
            return require("noice").api.status.command.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.command.has()
          end,
          color = function()
            return { fg = Snacks.util.color("Statement") }
          end,
        },
      }
      opts.sections.lualine_y = { lsp_clients }
      opts.sections.lualine_z = {
        { "location", separator = { left = "", right = "" }, icon = "" },
        { "progress", separator = { left = "", right = "" } },
      }
    end,
  },
}
