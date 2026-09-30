-- load matugen as LazyVim's colorscheme, so LazyVim doesn't load tokyonight
-- (its default) at startup only for matugen to paint over it
return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      require("matugen").setup({ transparent = false })
    end,
  },
}
