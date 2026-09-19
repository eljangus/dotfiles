return {
  "folke/noice.nvim",
  opts_extend = { "routes" },
  opts = {
    lsp = {
      progrss = {
        throttle = 1000,
      },
    },
    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
          any = {
            { find = "pyright" },
          },
        },
        opts = { skip = true },
      },
    },
  },
}
