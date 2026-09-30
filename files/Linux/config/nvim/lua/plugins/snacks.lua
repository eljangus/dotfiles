local backdrop = false

require("lazy.core.config").options.ui.backdrop = backdrop and 60 or 100

return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      float = { backdrop = backdrop },
    },
  },
}
