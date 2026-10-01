return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      qmlls = {
        -- Mason doesn't ship qmlls; it comes with qt6-declarative
        mason = false,
        cmd = { "/usr/lib/qt6/bin/qmlls" },
      },
    },
  },
}
