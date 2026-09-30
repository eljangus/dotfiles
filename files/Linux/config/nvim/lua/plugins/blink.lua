return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none",
      -- Ctrl-Space: open the menu, or accept the selected item if it's already open
      ["<C-space>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_and_accept()
          end
          return cmp.show()
        end,
      },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
  },
}
