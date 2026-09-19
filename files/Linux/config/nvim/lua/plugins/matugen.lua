return {
  dir = vim.fn.stdpath('config'),
  name = 'matugen',
  lazy = false,
  priority = 1000,
  config = function()
    require('matugen').setup({ transparent = false })
  end,
}
