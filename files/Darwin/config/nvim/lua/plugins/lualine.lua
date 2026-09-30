-- lualine's "auto" theme derives colors from generic highlight groups (e.g. PmenuSel),
-- which for paradise happens to equal the theme's foreground color, brightened further,
-- producing a near-white "normal mode" segment that clashes with the other modes.
-- Build the theme straight from the palette in kitty/themes/paradise.conf instead.
local paradise = {
  bg = "#151515",
  bg_alt = "#1f1f1f",
  bg_alt2 = "#414141",
  fg = "#e0e0e0",
  red = "#b66467",
  green = "#8c977d",
  yellow = "#d9bc8c",
  blue = "#8da3b9",
  magenta = "#a988b0",
  cyan = "#8aa6a2",
}

local function mode(accent)
  return {
    a = { bg = accent, fg = paradise.bg, gui = "bold" },
    b = { bg = paradise.bg_alt2, fg = paradise.fg },
    c = { bg = paradise.bg_alt, fg = paradise.fg },
  }
end

local paradise_theme = {
  normal = mode(paradise.blue),
  insert = mode(paradise.green),
  visual = mode(paradise.magenta),
  replace = mode(paradise.red),
  command = mode(paradise.yellow),
  inactive = {
    a = { bg = paradise.bg_alt, fg = paradise.bg_alt2, gui = "bold" },
    b = { bg = paradise.bg_alt, fg = paradise.bg_alt2 },
    c = { bg = paradise.bg_alt, fg = paradise.bg_alt2 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = vim.g.colors_name == "paradise" and paradise_theme or "auto"
  end,
}
