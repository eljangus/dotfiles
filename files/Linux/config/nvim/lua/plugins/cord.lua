return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy",
  opts = {
    -- editor = { tooltip = "LazyVim" },
    -- idle = { enabled = true, timeout = 300000 },
  },
}
