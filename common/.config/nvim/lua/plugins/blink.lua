return {
  "saghen/blink.cmp",
  dependencies = {
    "Kaiser-Yang/blink-cmp-avante",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- ['<C-e>'] = { 'hide' },
      -- ['<C-y>'] = { 'select_and_accept' },
      --
      -- ['<Up>'] = { 'select_prev', 'fallback' },
      -- ['<Down>'] = { 'select_next', 'fallback' },
      -- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      -- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      --
      -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      --
      -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      --
      -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      preset = "default",
      -- Think of <c-l> as moving to the right of your snippet expansion.
      --  So if you have a snippet that's like:
      --  function $name($args)
      --    $body
      --  end
      --
      -- <c-l> or <tab> will move you to the right of each of the expansion locations.
      -- <c-h> or <s-tab> is similar, except moving you backwards.
      ["<C-l>"] = { "snippet_forward" },
      ["<C-h>"] = { "snippet_backward" },
      -- Search the snippet corresponding to the keyword
      -- and accept it
      ["<Tab>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return
          end

          local keyword = require("blink.cmp.completion.list").context.get_keyword()
          local accept_index = nil

          for index, item in ipairs(cmp.get_items()) do
            if item.source_id == "snippets" and item.label == keyword then
              accept_index = index
              break
            end
          end

          if accept_index then
            cmp.accept({ index = accept_index })
            return true
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
    sources = {
      -- Add 'avante' to the list
      default = { "avante", "lsp", "path", "snippets", "buffer" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {
            -- options for blink-cmp-avante
          },
        },
      },
    },
    completion = {
      accept = { auto_brackets = { enabled = false } },
      menu = {
        scrollbar = false,
      },
      documentation = {
        window = {
          scrollbar = false,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
  },
  keys = {
    {
      "<leader><space>",
      false,
    },
  },
}
