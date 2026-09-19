-- noctalia -> Neovim colorscheme, base16 edition. Generated into
-- ~/.config/nvim/lua/matugen.lua on every wallpaper / light-dark change; do
-- not edit that copy, edit the template. A running Neovim is refreshed live
-- via SIGUSR1 (see apply.sh).
--
-- Deliberately minimal: 16 flat base16 slots, no Material tonal-ramp math, no
-- blending except a single helper for the lualine "one rung darker" section.
-- base08-0F come straight from noctalia's terminal ANSI colours, which are
-- already tuned to be distinct from each other -- exactly what base16 wants,
-- and something a single-wallpaper Material palette (primary/secondary/
-- tertiary can come out near-identical) often isn't. The Material You
-- version of this same idea is retired in ../.archive/neovim-lazy -- this
-- template is the only actively-used one now.
--
-- Icon backgrounds in bufferline: this template does NOT try to patch them
-- from here. bufferline re-derives its own colours on every ColorScheme
-- event and feeds per-filetype icon highlights from that, so anything set
-- only from inside this file is always one step behind. apply.sh instead
-- drops a small lazy.nvim spec that gives bufferline.setup() a `highlights`
-- *function* (its documented, supported extension point) that reads
-- require('matugen').get_palette() fresh every time bufferline re-derives --
-- so the icon backgrounds can never drift from the tab they sit on.

local M = {}

M.base16 = {
  dark = {
    base00 = '{{colors.surface.dark.hex}}',
    base01 = '{{colors.surface_container_low.dark.hex}}',
    base02 = '{{colors.surface_container_high.dark.hex}}',
    base03 = '{{colors.outline.dark.hex}}',
    base04 = '{{colors.on_surface_variant.dark.hex}}',
    base05 = '{{colors.on_surface.dark.hex}}',
    base06 = '{{colors.on_surface.dark.hex}}',
    base07 = '{{colors.surface_container_highest.dark.hex}}',
    base08 = '{{colors.terminal_normal_red.dark.hex}}',
    base09 = '{{colors.terminal_bright_red.dark.hex}}',
    base0A = '{{colors.terminal_normal_yellow.dark.hex}}',
    base0B = '{{colors.terminal_normal_green.dark.hex}}',
    base0C = '{{colors.terminal_normal_cyan.dark.hex}}',
    base0D = '{{colors.terminal_normal_blue.dark.hex}}',
    base0E = '{{colors.terminal_normal_magenta.dark.hex}}',
    base0F = '{{colors.terminal_bright_black.dark.hex}}',
    term = {
      black = '{{colors.terminal_normal_black.dark.hex}}',
      red = '{{colors.terminal_normal_red.dark.hex}}',
      green = '{{colors.terminal_normal_green.dark.hex}}',
      yellow = '{{colors.terminal_normal_yellow.dark.hex}}',
      blue = '{{colors.terminal_normal_blue.dark.hex}}',
      magenta = '{{colors.terminal_normal_magenta.dark.hex}}',
      cyan = '{{colors.terminal_normal_cyan.dark.hex}}',
      white = '{{colors.terminal_normal_white.dark.hex}}',
      bright_black = '{{colors.terminal_bright_black.dark.hex}}',
      bright_red = '{{colors.terminal_bright_red.dark.hex}}',
      bright_green = '{{colors.terminal_bright_green.dark.hex}}',
      bright_yellow = '{{colors.terminal_bright_yellow.dark.hex}}',
      bright_blue = '{{colors.terminal_bright_blue.dark.hex}}',
      bright_magenta = '{{colors.terminal_bright_magenta.dark.hex}}',
      bright_cyan = '{{colors.terminal_bright_cyan.dark.hex}}',
      bright_white = '{{colors.terminal_bright_white.dark.hex}}',
      bg = '{{colors.terminal_background.dark.hex}}',
      fg = '{{colors.terminal_foreground.dark.hex}}',
      cursor = '{{colors.terminal_cursor.dark.hex}}',
      cursor_text = '{{colors.terminal_cursor_text.dark.hex}}',
      selection = '{{colors.terminal_selection_bg.dark.hex}}',
    },
  },
  light = {
    base00 = '{{colors.surface.light.hex}}',
    base01 = '{{colors.surface_container_low.light.hex}}',
    base02 = '{{colors.surface_container_high.light.hex}}',
    base03 = '{{colors.outline.light.hex}}',
    base04 = '{{colors.on_surface_variant.light.hex}}',
    base05 = '{{colors.on_surface.light.hex}}',
    base06 = '{{colors.on_surface.light.hex}}',
    base07 = '{{colors.surface_container_highest.light.hex}}',
    base08 = '{{colors.terminal_normal_red.light.hex}}',
    base09 = '{{colors.terminal_bright_red.light.hex}}',
    base0A = '{{colors.terminal_normal_yellow.light.hex}}',
    base0B = '{{colors.terminal_normal_green.light.hex}}',
    base0C = '{{colors.terminal_normal_cyan.light.hex}}',
    base0D = '{{colors.terminal_normal_blue.light.hex}}',
    base0E = '{{colors.terminal_normal_magenta.light.hex}}',
    base0F = '{{colors.terminal_bright_black.light.hex}}',
    term = {
      black = '{{colors.terminal_normal_black.light.hex}}',
      red = '{{colors.terminal_normal_red.light.hex}}',
      green = '{{colors.terminal_normal_green.light.hex}}',
      yellow = '{{colors.terminal_normal_yellow.light.hex}}',
      blue = '{{colors.terminal_normal_blue.light.hex}}',
      magenta = '{{colors.terminal_normal_magenta.light.hex}}',
      cyan = '{{colors.terminal_normal_cyan.light.hex}}',
      white = '{{colors.terminal_normal_white.light.hex}}',
      bright_black = '{{colors.terminal_bright_black.light.hex}}',
      bright_red = '{{colors.terminal_bright_red.light.hex}}',
      bright_green = '{{colors.terminal_bright_green.light.hex}}',
      bright_yellow = '{{colors.terminal_bright_yellow.light.hex}}',
      bright_blue = '{{colors.terminal_bright_blue.light.hex}}',
      bright_magenta = '{{colors.terminal_bright_magenta.light.hex}}',
      bright_cyan = '{{colors.terminal_bright_cyan.light.hex}}',
      bright_white = '{{colors.terminal_bright_white.light.hex}}',
      bg = '{{colors.terminal_background.light.hex}}',
      fg = '{{colors.terminal_foreground.light.hex}}',
      cursor = '{{colors.terminal_cursor.light.hex}}',
      cursor_text = '{{colors.terminal_cursor_text.light.hex}}',
      selection = '{{colors.terminal_selection_bg.light.hex}}',
    },
  },
}

-- `.default` follows the live mode, so it equals `.light` iff noctalia is light.
M.noctalia_mode = ('{{colors.surface.default.hex}}' == '{{colors.surface.light.hex}}') and 'light' or 'dark'

_G.__matugen_opts = _G.__matugen_opts or {}
M.transparent = _G.__matugen_opts.transparent == true

local function hex2rgb(hex)
  hex = hex:gsub('#', '')
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb2hex(r, g, b)
  return string.format('#%02x%02x%02x',
    math.min(255, math.max(0, math.floor(r + 0.5))),
    math.min(255, math.max(0, math.floor(g + 0.5))),
    math.min(255, math.max(0, math.floor(b + 0.5))))
end

-- the only colour math in this template, used for the lualine theme below:
-- `blend` steps a colour toward another, `on` picks whichever of two fixed
-- near-black/near-white inks reads better against a given colour (mirrors
-- the retired neovim-lazy template's lualine treatment, just without the
-- Material tonal roles).
local function blend(fg, bg, alpha)
  local fr, fg2, fb = hex2rgb(fg)
  local br, bg2, bb = hex2rgb(bg)
  return rgb2hex(alpha * fr + (1 - alpha) * br, alpha * fg2 + (1 - alpha) * bg2, alpha * fb + (1 - alpha) * bb)
end

local function luminance(hex)
  local r, g, b = hex2rgb(hex)
  local function lin(c)
    c = c / 255
    return c <= 0.03928 and c / 12.92 or ((c + 0.055) / 1.055) ^ 2.4
  end
  return 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b)
end

local function contrast(a, b)
  local la, lb = luminance(a), luminance(b)
  if la < lb then
    la, lb = lb, la
  end
  return (la + 0.05) / (lb + 0.05)
end

-- true near-black / near-white, regardless of which mode is currently live,
-- so there's always a genuinely dark and a genuinely light ink to pick from.
local ink_dark = M.base16.dark.base00
local ink_light = M.base16.light.base00
local function on(c)
  return contrast(ink_dark, c) >= contrast(ink_light, c) and ink_dark or ink_light
end

local function make_palette(mode)
  local b = M.base16[mode]
  return {
    none = 'NONE',
    bg = b.base00,
    bg_low = b.base01,
    bg_sel = b.base02,
    muted = b.base03,
    fg_dim = b.base04,
    fg = b.base05,
    fg_bright = b.base06,
    bg_bright = b.base07,
    red = b.base08,
    orange = b.base09,
    yellow = b.base0A,
    green = b.base0B,
    cyan = b.base0C,
    blue = b.base0D,
    magenta = b.base0E,
    brown = b.base0F,
    -- Tabline / bufferline chrome: fill is flush with the editor, inactive
    -- tabs sit one clear rung above it, the selected tab brighter still.
    -- Icon backgrounds are kept in lockstep with these by apply.sh -- see
    -- the note at the top of this file.
    nc = b.base00,
    tab_bg = b.base01,
    tab_sel = b.base07,
    term = b.term,
  }
end

M.palette = make_palette(M.noctalia_mode)

function M.get_palette()
  return M.palette
end

local function make_lualine_theme(p)
  local c = { bg = p.tab_bg, fg = p.fg_dim }
  -- `b` steps down from the mode colour rather than a fixed tone, so it's
  -- always readable as "between `a` and `c`" regardless of the accent. `a`'s
  -- text picks whichever ink actually contrasts against that hue, rather
  -- than assuming the bg colour always works (it won't for every accent).
  local function section(hue)
    return { a = { bg = hue, fg = on(hue), gui = 'bold' }, b = { bg = blend(hue, p.bg, 0.3), fg = p.fg }, c = c }
  end
  return {
    normal = section(p.blue),
    insert = section(p.green),
    visual = section(p.magenta),
    replace = section(p.red),
    command = section(p.yellow),
    inactive = {
      a = { bg = p.bg_low, fg = p.muted, gui = 'bold' },
      b = { bg = p.bg_low, fg = p.muted },
      c = { bg = p.tab_bg, fg = p.muted },
    },
  }
end

local lualine_theme = make_lualine_theme(M.palette)

function M.get_lualine_theme()
  return lualine_theme
end

-- -------------------------------------------------------------------- highlights
local function build(p, transparent)
  local ed = transparent and 'NONE' or p.bg
  -- Every float/popup is flush with the editor -- LSP hover, Pmenu,
  -- Telescope, which-key, Noice cmdline, blink.cmp, trouble, all of it.
  local fl = ed
  local eob = p.bg
  local term_bg = transparent and 'NONE' or p.term.bg
  local git_add, git_change, git_delete = p.green, p.yellow, p.red
  local heading_hue = { p.blue, p.magenta, p.green, p.orange, p.cyan, p.yellow }

  local t = {}

  -- editor UI
  t.Normal = { fg = p.fg, bg = ed }
  t.NormalNC = { fg = p.fg, bg = ed }
  t.NormalFloat = { fg = p.fg, bg = fl }
  t.NormalTerminal = { fg = p.term.fg, bg = term_bg }
  t.Terminal = { fg = p.term.fg, bg = term_bg }
  t.TerminalBorder = { fg = p.muted, bg = term_bg }
  t.FloatBorder = { fg = p.muted, bg = fl }
  t.FloatTitle = { fg = p.blue, bg = fl, bold = true }
  t.FloatFooter = { fg = p.muted, bg = fl }
  t.ColorColumn = { bg = p.bg_low }
  t.Conceal = { bg = 'NONE' }
  t.Cursor = { fg = p.bg, bg = p.fg }
  t.lCursor = { link = 'Cursor' }
  t.CursorIM = { link = 'Cursor' }
  t.TermCursor = { fg = p.term.cursor_text, bg = p.term.cursor }
  t.CursorColumn = { bg = p.bg_sel }
  t.CursorLine = { bg = p.bg_sel }
  t.CursorLineNr = { fg = p.fg, bold = true }
  t.LineNr = { fg = p.muted }
  t.SignColumn = { fg = p.fg, bg = 'NONE' }
  t.FoldColumn = { fg = p.muted, bg = 'NONE' }
  t.Folded = { fg = p.fg_dim, bg = p.bg_low }
  t.EndOfBuffer = { fg = eob }
  t.NonText = { fg = p.muted }
  t.Whitespace = { fg = p.muted }
  t.SpecialKey = { fg = p.cyan }
  t.MatchParen = { fg = p.orange, bg = p.bg_sel, bold = true }
  t.Visual = { bg = p.bg_sel }
  t.VisualNOS = { bg = p.bg_sel }
  t.Search = { fg = p.bg, bg = p.yellow }
  t.IncSearch = { fg = p.bg, bg = p.orange }
  t.CurSearch = { fg = p.bg, bg = p.orange }
  t.Substitute = { fg = p.bg, bg = p.red }
  t.Pmenu = { fg = p.fg_dim, bg = fl }
  t.PmenuSel = { fg = p.fg, bg = p.bg_sel, bold = true }
  t.PmenuKind = { fg = p.cyan, bg = fl }
  t.PmenuKindSel = { fg = p.cyan, bg = p.bg_sel }
  t.PmenuExtra = { fg = p.muted, bg = fl }
  t.PmenuExtraSel = { fg = p.fg_dim, bg = p.bg_sel }
  t.PmenuMatch = { fg = p.orange, bg = fl, bold = true }
  t.PmenuMatchSel = { fg = p.orange, bg = p.bg_sel, bold = true }
  t.PmenuSbar = { bg = p.bg_low }
  t.PmenuThumb = { bg = p.muted }
  t.WildMenu = { link = 'IncSearch' }
  t.Directory = { fg = p.blue, bold = true }
  t.Title = { fg = p.blue, bold = true }
  t.ModeMsg = { fg = p.fg_dim }
  t.MsgArea = { fg = p.fg }
  t.MoreMsg = { fg = p.green }
  t.Question = { fg = p.yellow }
  t.ErrorMsg = { fg = p.red, bold = true }
  t.WarningMsg = { fg = p.yellow, bold = true }
  t.WinBar = { fg = p.fg_dim, bg = ed }
  t.WinBarNC = { fg = p.muted, bg = ed }
  t.WinSeparator = { fg = p.muted, bg = ed }
  t.VertSplit = { fg = p.muted, bg = ed }
  t.StatusLine = { fg = p.fg_dim, bg = p.bg_low }
  t.StatusLineNC = { fg = p.muted, bg = p.bg_low }
  t.TabLine = { fg = p.fg_dim, bg = p.nc }
  t.TabLineFill = { bg = p.nc }
  t.TabLineSel = { fg = p.fg, bg = p.tab_sel, bold = true }

  -- spelling
  t.SpellBad = { sp = p.red, undercurl = true }
  t.SpellCap = { sp = p.yellow, undercurl = true }
  t.SpellLocal = { sp = p.cyan, undercurl = true }
  t.SpellRare = { sp = p.magenta, undercurl = true }

  -- diff / git status
  t.DiffAdd = { fg = git_add, bg = p.bg_low }
  t.DiffChange = { fg = git_change, bg = p.bg_low }
  t.DiffDelete = { fg = git_delete, bg = p.bg_low }
  t.DiffText = { fg = git_change, bg = p.bg_sel, bold = true }
  t.diffAdded = { fg = git_add }
  t.diffChanged = { fg = git_change }
  t.diffRemoved = { fg = git_delete }
  t.Added = { fg = git_add }
  t.Changed = { fg = git_change }
  t.Removed = { fg = git_delete }

  -- syntax
  t.Comment = { fg = p.muted, italic = true }
  t.Constant = { fg = p.orange }
  t.String = { fg = p.green }
  t.Character = { fg = p.green }
  t.Number = { fg = p.orange }
  t.Float = { fg = p.orange }
  t.Boolean = { fg = p.orange }
  t.Identifier = { fg = p.fg }
  t.Function = { fg = p.blue }
  t.Statement = { fg = p.magenta, bold = true }
  t.Conditional = { fg = p.magenta }
  t.Repeat = { fg = p.magenta }
  t.Label = { fg = p.cyan }
  t.Operator = { fg = p.fg_dim }
  t.Keyword = { fg = p.magenta }
  t.Exception = { fg = p.magenta }
  t.PreProc = { fg = p.cyan }
  t.Include = { fg = p.magenta }
  t.Define = { fg = p.cyan }
  t.Macro = { fg = p.cyan }
  t.Type = { fg = p.yellow }
  t.StorageClass = { fg = p.yellow }
  t.Structure = { fg = p.yellow }
  t.Special = { fg = p.cyan }
  t.Delimiter = { fg = p.fg_dim }
  t.Underlined = { fg = p.blue, underline = true }
  t.Ignore = { fg = p.muted }
  t.Error = { fg = p.red }
  t.Todo = { fg = p.yellow, bold = true }
  t.Bold = { bold = true }
  t.Italic = { italic = true }

  -- diagnostics
  local diag = { Error = p.red, Warn = p.yellow, Info = p.blue, Hint = p.cyan, Ok = p.green }
  for name, hue in pairs(diag) do
    t['Diagnostic' .. name] = { fg = hue }
    t['DiagnosticSign' .. name] = { fg = hue }
    t['DiagnosticFloating' .. name] = { fg = hue }
    t['DiagnosticVirtualText' .. name] = { fg = hue }
    t['DiagnosticVirtualLines' .. name] = { fg = hue }
    t['DiagnosticUnderline' .. name] = { sp = hue, undercurl = true }
  end
  t.DiagnosticUnnecessary = { fg = p.muted }
  t.DiagnosticDeprecated = { fg = p.muted, strikethrough = true }

  -- LSP
  t.LspReferenceText = { bg = p.bg_sel }
  t.LspReferenceRead = { bg = p.bg_sel }
  t.LspReferenceWrite = { bg = p.bg_sel, underline = true }
  t.LspSignatureActiveParameter = { fg = p.orange, bg = p.bg_sel }
  t.LspInlayHint = { fg = p.muted, italic = true }

  -- tree-sitter (falls back to the syntax groups above for anything unset)
  t['@variable'] = { fg = p.fg }
  t['@variable.builtin'] = { fg = p.red, italic = true }
  t['@variable.parameter'] = { fg = p.orange, italic = true }
  t['@variable.member'] = { fg = p.cyan }
  t['@constant'] = { link = 'Constant' }
  t['@constant.builtin'] = { fg = p.orange, bold = true }
  t['@module'] = { fg = p.fg }
  t['@string'] = { link = 'String' }
  t['@string.escape'] = { fg = p.magenta }
  t['@string.special.url'] = { fg = p.blue, underline = true }
  t['@character'] = { link = 'Character' }
  t['@boolean'] = { link = 'Boolean' }
  t['@number'] = { link = 'Number' }
  t['@type'] = { link = 'Type' }
  t['@type.builtin'] = { fg = p.yellow, bold = true }
  t['@attribute'] = { fg = p.cyan }
  t['@property'] = { fg = p.cyan, italic = true }
  t['@function'] = { link = 'Function' }
  t['@function.builtin'] = { fg = p.blue, italic = true }
  t['@function.method'] = { link = 'Function' }
  t['@constructor'] = { fg = p.yellow }
  t['@operator'] = { link = 'Operator' }
  t['@keyword'] = { link = 'Keyword' }
  t['@keyword.function'] = { fg = p.magenta }
  t['@keyword.return'] = { fg = p.magenta, italic = true }
  t['@punctuation.delimiter'] = { fg = p.fg_dim }
  t['@punctuation.bracket'] = { fg = p.fg_dim }
  t['@punctuation.special'] = { fg = p.cyan }
  t['@comment'] = { link = 'Comment' }
  t['@comment.todo'] = { fg = p.bg, bg = p.yellow, bold = true }
  t['@comment.error'] = { fg = p.bg, bg = p.red, bold = true }
  t['@comment.warning'] = { fg = p.bg, bg = p.yellow, bold = true }
  t['@comment.note'] = { fg = p.bg, bg = p.cyan, bold = true }
  t['@markup.strong'] = { bold = true }
  t['@markup.italic'] = { italic = true }
  t['@markup.strikethrough'] = { strikethrough = true }
  t['@markup.underline'] = { underline = true }
  for i = 1, 6 do
    t['@markup.heading.' .. i] = { fg = heading_hue[i], bold = true }
    t['markdownH' .. i] = { fg = heading_hue[i], bold = true }
    t['markdownH' .. i .. 'Delimiter'] = { fg = heading_hue[i], bold = true }
  end
  t['@markup.link'] = { fg = p.blue }
  t['@markup.link.url'] = { fg = p.blue, underline = true }
  t['@markup.raw'] = { fg = p.green }
  t['@markup.raw.block'] = { bg = p.bg_low }
  t['@markup.list'] = { fg = p.magenta }
  t['@diff.plus'] = { fg = git_add }
  t['@diff.minus'] = { fg = git_delete }
  t['@diff.delta'] = { fg = git_change }
  t['@tag'] = { fg = p.cyan }
  t['@tag.attribute'] = { fg = p.orange, italic = true }
  t['@tag.delimiter'] = { fg = p.fg_dim }

  -- gitsigns.nvim
  t.GitSignsAdd = { fg = git_add }
  t.GitSignsChange = { fg = git_change }
  t.GitSignsDelete = { fg = git_delete }
  t.GitSignsCurrentLineBlame = { fg = p.muted, italic = true }

  -- telescope.nvim (all flush, matching every other float)
  t.TelescopeNormal = { fg = p.fg, bg = fl }
  t.TelescopeBorder = { fg = p.muted, bg = fl }
  t.TelescopeTitle = { fg = p.fg_dim }
  t.TelescopePromptNormal = { fg = p.fg, bg = fl }
  t.TelescopePromptBorder = { fg = p.muted, bg = fl }
  t.TelescopePromptTitle = { fg = p.bg, bg = p.blue, bold = true }
  t.TelescopePromptPrefix = { fg = p.blue }
  t.TelescopeResultsNormal = { fg = p.fg_dim, bg = fl }
  t.TelescopeResultsBorder = { fg = p.muted, bg = fl }
  t.TelescopeResultsTitle = { fg = p.bg, bg = p.green, bold = true }
  t.TelescopePreviewNormal = { fg = p.fg, bg = fl }
  t.TelescopePreviewBorder = { fg = p.muted, bg = fl }
  t.TelescopePreviewTitle = { fg = p.bg, bg = p.yellow, bold = true }
  t.TelescopeSelection = { fg = p.fg, bg = p.bg_sel }
  t.TelescopeSelectionCaret = { fg = p.blue, bg = p.bg_sel }
  t.TelescopeMatching = { fg = p.orange, bold = true }

  -- which-key.nvim / mini.icons
  t.WhichKey = { fg = p.blue }
  t.WhichKeyGroup = { fg = p.cyan }
  t.WhichKeyDesc = { fg = p.fg }
  t.WhichKeySeparator = { fg = p.muted }
  t.WhichKeyValue = { fg = p.fg_dim }
  t.WhichKeyFloat = { bg = fl }
  t.WhichKeyNormal = { bg = fl }
  t.WhichKeyBorder = { fg = p.muted, bg = fl }
  t.WhichKeyTitle = { fg = p.cyan, bg = fl, bold = true }
  t.WhichKeyIcon = { fg = p.cyan }
  local icon_hue = {
    Blue = p.blue,
    Cyan = p.cyan,
    Green = p.green,
    Grey = p.fg_dim,
    Orange = p.orange,
    Purple = p
        .magenta,
    Red = p.red,
    Yellow = p.yellow
  }
  for name, hue in pairs(icon_hue) do
    t['WhichKeyIcon' .. name] = { fg = hue }
    t['MiniIcons' .. name] = { fg = hue }
  end

  -- snacks.nvim (slightly elevated, same bg as an unfocused tab) / neo-tree.nvim (flush, same as every other float)
  local snacks_bg = transparent and 'NONE' or p.tab_bg
  t.SnacksNormal = { fg = p.fg, bg = snacks_bg }
  t.SnacksNormalNC = { fg = p.fg, bg = snacks_bg }
  t.SnacksPicker = { fg = p.fg, bg = snacks_bg }
  t.SnacksPickerBorder = { fg = p.muted, bg = snacks_bg }
  t.SnacksPickerTitle = { fg = p.cyan, bg = snacks_bg, bold = true }
  t.SnacksPickerFooter = { fg = p.muted, bg = snacks_bg }
  t.SnacksTitle = { fg = p.cyan, bg = snacks_bg, bold = true }
  t.SnacksFooter = { fg = p.muted, bg = snacks_bg }
  -- the snacks terminal is flush with the editor; swapped in via winhighlight
  -- by the snacks_terminal autocmd below
  t.SnacksTerminalNormal = { fg = p.fg, bg = ed }
  t.SnacksTerminalNormalNC = { fg = p.fg, bg = ed }
  t.NeoTreeNormal = { fg = p.fg, bg = ed }
  t.NeoTreeNormalNC = { fg = p.fg, bg = ed }
  t.NeoTreeWinSeparator = { fg = p.muted, bg = ed }
  t.NeoTreeRootName = { fg = p.cyan, bold = true }
  t.NeoTreeDirectoryName = { fg = p.blue, bold = true }
  t.NeoTreeDirectoryIcon = { fg = p.blue }
  t.NeoTreeFileName = { fg = p.fg }
  t.NeoTreeIndentMarker = { fg = p.muted }
  t.NeoTreeGitAdded = { fg = git_add }
  t.NeoTreeGitModified = { fg = git_change }
  t.NeoTreeGitDeleted = { fg = git_delete }
  t.NeoTreeGitUntracked = { fg = p.magenta, italic = true }

  -- blink.cmp / nvim-cmp
  t.BlinkCmpMenu = { fg = p.fg_dim, bg = fl }
  t.BlinkCmpMenuBorder = { fg = p.muted, bg = fl }
  t.BlinkCmpMenuSelection = { fg = p.fg, bg = p.bg_sel, bold = true }
  t.BlinkCmpLabel = { fg = p.fg_dim }
  t.BlinkCmpLabelMatch = { fg = p.orange, bold = true }
  t.BlinkCmpLabelDetail = { fg = p.muted }
  t.BlinkCmpKind = { fg = p.cyan }
  t.BlinkCmpDoc = { fg = p.fg, bg = fl }
  t.BlinkCmpDocBorder = { fg = p.muted, bg = fl }
  local kind_hue = {
    Method = p.blue,
    Function = p.blue,
    Constructor = p.yellow,
    Field = p.cyan,
    Variable = p.fg,
    Property = p.cyan,
    Class = p.yellow,
    Interface = p.yellow,
    Struct = p.yellow,
    Module = p.cyan,
    Enum = p.yellow,
    EnumMember = p.cyan,
    Constant = p.orange,
    Value = p.orange,
    Keyword = p.magenta,
    Snippet = p.magenta,
    Color = p.red,
    File = p.cyan,
    Folder = p.cyan,
    Event = p.yellow,
    Operator = p.fg_dim,
    TypeParameter = p.magenta,
  }
  for kind, hue in pairs(kind_hue) do
    t['BlinkCmpKind' .. kind] = { fg = hue }
    t['CmpItemKind' .. kind] = { fg = hue }
  end

  -- noice.nvim (flush cmdline popup, which-key's real-world companion)
  t.NoiceCmdline = { fg = p.fg, bg = fl }
  t.NoiceCmdlinePopup = { fg = p.fg, bg = fl }
  t.NoiceCmdlinePopupBorder = { fg = p.muted, bg = fl }
  t.NoiceCmdlinePopupTitle = { fg = p.cyan, bold = true }
  t.NoiceCmdlineIcon = { fg = p.magenta }
  t.NoiceConfirm = { fg = p.fg, bg = fl }
  t.NoiceConfirmBorder = { fg = p.muted, bg = fl }
  -- the [J]a / (N)ein / (A)bbrechen choices inside a Confirm popup default-
  -- link to CursorLine/Visual (both an elevated bg_sel) rather than to
  -- anything Noice-prefixed, so setting NoiceConfirm* above doesn't reach
  -- them -- flush like the rest of the popup, default choice marked by
  -- colour instead of a background block.
  t.NoiceFormatConfirm = { fg = p.fg, bg = fl }
  t.NoiceFormatConfirmDefault = { fg = p.blue, bg = fl, bold = true }
  t.NoicePopup = { fg = p.fg, bg = fl }
  t.NoicePopupBorder = { fg = p.muted, bg = fl }
  t.NoiceMini = { fg = p.fg_dim, bg = fl }

  -- trouble.nvim
  t.TroubleNormal = { fg = p.fg, bg = fl }
  t.TroubleNormalNC = { fg = p.fg, bg = fl }
  t.TroubleText = { fg = p.fg }
  t.TroubleCount = { fg = p.magenta, bg = p.bg_sel }
  t.TroubleFileName = { fg = p.cyan }

  -- bufferline.nvim: fill (nc) flush, inactive tabs one rung up (tab_bg),
  -- selected tab brighter still (tab_sel). Per-filetype icon backgrounds are
  -- kept matching these via apply.sh (see the note at the top of this file);
  -- the "Default" icon group here is still set directly since it never goes
  -- through that path.
  local bl_fill = p.nc
  local bl_off = p.tab_bg
  local bl_sel = p.tab_sel
  local states = {
    { suf = '',         bg = bl_off, fg = p.muted,  accent = p.fg_dim },
    { suf = 'Visible',  bg = bl_off, fg = p.fg_dim, accent = p.fg_dim },
    { suf = 'Selected', bg = bl_sel, fg = p.fg,     accent = p.blue,  bold = true },
  }
  for _, s in ipairs(states) do
    t['BufferLineBackground' .. s.suf] = { fg = p.muted, bg = s.bg }
    t['BufferLineBuffer' .. s.suf] = { fg = s.fg, bg = s.bg, bold = s.bold, italic = s.suf == 'Selected' }
    t['BufferLineCloseButton' .. s.suf] = { fg = s.suf == 'Selected' and p.red or p.muted, bg = s.bg }
    t['BufferLineModified' .. s.suf] = { fg = git_change, bg = s.bg }
    t['BufferLineDuplicate' .. s.suf] = { fg = p.muted, bg = s.bg, italic = true }
    t['BufferLinePick' .. s.suf] = { fg = p.red, bg = s.bg, bold = true }
    t['BufferLineSeparator' .. s.suf] = { fg = bl_fill, bg = s.bg }
    t['BufferLineIndicator' .. s.suf] = { fg = s.suf == 'Selected' and p.blue or s.bg, bg = s.bg }
    t['BufferLineTabSeparator' .. s.suf] = { fg = bl_fill, bg = s.bg }
    t['BufferLineDevIconDefault' .. s.suf] = { fg = p.cyan, bg = s.bg }
  end
  t.BufferLineFill = { fg = p.muted, bg = bl_fill }
  t.BufferLineTab = { fg = p.muted, bg = bl_off }
  t.BufferLineTabSelected = { fg = p.bg, bg = p.blue, bold = true }
  t.BufferLineTabClose = { fg = p.red, bg = bl_fill }

  -- todo-comments.nvim
  local todo = {
    FIX = p.red,
    TODO = p.magenta,
    HACK = p.yellow,
    WARN = p.yellow,
    PERF = p.cyan,
    NOTE = p.blue,
    TEST = p
        .green
  }
  for key, hue in pairs(todo) do
    t['TodoFg' .. key] = { fg = hue }
    t['TodoBg' .. key] = { fg = p.bg, bg = hue, bold = true }
    t['TodoSign' .. key] = { fg = hue }
  end

  return t
end

-- ------------------------------------------------------------------------- apply
local function set_terminal_colors(term)
  local ansi = {
    term.black, term.red, term.green, term.yellow,
    term.blue, term.magenta, term.cyan, term.white,
    term.bright_black, term.bright_red, term.bright_green, term.bright_yellow,
    term.bright_blue, term.bright_magenta, term.bright_cyan, term.bright_white,
  }
  for i = 1, 16 do
    vim.g['terminal_color_' .. (i - 1)] = ansi[i]
  end
end

local function retheme_lualine(theme)
  local ok, err = pcall(function()
    if not package.loaded['lualine'] then
      return
    end
    local lualine = require('lualine')
    local cfg = lualine.get_config() or {}
    cfg.options = cfg.options or {}
    cfg.options.theme = theme
    lualine.setup(cfg)
    lualine.refresh()
  end)
  if not ok then
    vim.notify('matugen: lualine re-theme failed: ' .. tostring(err), vim.log.levels.WARN)
  end
end

-- matugen loads eagerly at startup (priority 1000, lazy=false) so it can
-- paint the editor before anything else draws, but that means the very
-- first M.setup() call runs before lualine (event = "VeryLazy" in LazyVim)
-- has loaded -- retheme_lualine's guard above just silently no-ops then, and
-- nothing ever retries, so on a fresh start lualine keeps its own default
-- theme forever unless a later wallpaper change happens to retrigger setup.
-- Catch the moment lualine actually loads and retheme it then too.
if not _G.__matugen_lualine_autocmd then
  _G.__matugen_lualine_autocmd = true
  vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyLoad',
    callback = function(ev)
      if ev.data == 'lualine.nvim' then
        vim.schedule(function()
          retheme_lualine(lualine_theme)
        end)
      end
    end,
  })
end

-- snacks.nvim windows all map Normal -> SnacksNormal (the elevated colour) and
-- its terminal style has no highlight group of its own, so repoint just the
-- terminal windows at the flush SnacksTerminalNormal groups.
if not _G.__matugen_snacks_term_autocmd then
  _G.__matugen_snacks_term_autocmd = true
  -- BufWinEnter fires before snacks applies the window's options (so
  -- winhighlight is still empty then), TermOpen fires after; the rewrite is
  -- idempotent, and scheduling covers both orderings.
  vim.api.nvim_create_autocmd({ 'BufWinEnter', 'TermOpen' }, {
    callback = function(ev)
      vim.schedule(function()
        if not vim.api.nvim_buf_is_valid(ev.buf) or vim.bo[ev.buf].filetype ~= 'snacks_terminal' then
          return
        end
        local win = vim.fn.bufwinid(ev.buf)
        if win == -1 then
          return
        end
        local whl = vim.wo[win].winhighlight
        whl = whl:gsub('Normal:SnacksNormal', 'Normal:SnacksTerminalNormal'):gsub('NormalNC:SnacksNormalNC', 'NormalNC:SnacksTerminalNormalNC')
        vim.wo[win].winhighlight = whl
      end)
    end,
  })
end

local function user_overrides(p)
  local ok, mod = pcall(require, 'matugen_overrides')
  if ok and type(mod) == 'function' then
    local ok2, extra = pcall(mod, p)
    if ok2 and type(extra) == 'table' then
      return extra
    end
  end
  return {}
end

function M.setup(opts)
  opts = opts or {}
  if opts.transparent ~= nil then
    M.transparent = opts.transparent == true
    _G.__matugen_opts.transparent = M.transparent
  end

  local mode = M.noctalia_mode
  vim.o.background = mode
  vim.o.termguicolors = true

  local p = make_palette(mode)
  M.palette = p
  lualine_theme = make_lualine_theme(p)

  if vim.g.colors_name then
    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') == 1 then
      vim.cmd('syntax reset')
    end
  end
  vim.g.colors_name = 'matugen'

  local groups = build(p, M.transparent)
  for group, spec in pairs(user_overrides(p)) do
    groups[group] = spec
  end
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  set_terminal_colors(p.term)
  retheme_lualine(lualine_theme)
  -- This is what makes the bufferline.nvim `highlights` function (installed
  -- by apply.sh) re-run and re-read our fresh palette, which is what keeps
  -- per-filetype tab icon backgrounds in sync -- see the note up top.
  pcall(vim.api.nvim_exec_autocmds, 'ColorScheme', { modeline = false, pattern = 'matugen' })
  pcall(vim.cmd.redraw, { bang = true })
end

-- ------------------------------------------------------- live reload (SIGUSR1)
local ok_signal, signal_err = pcall(function()
  local uv = vim.uv or vim.loop
  if _G.__matugen_signal then
    _G.__matugen_signal:stop()
    _G.__matugen_signal:close()
  end
  local signal = uv.new_signal()
  _G.__matugen_signal = signal
  signal:start('sigusr1', vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    local ok, mod = pcall(require, 'matugen')
    if not ok then
      vim.notify('matugen: reload failed: ' .. tostring(mod), vim.log.levels.ERROR)
      return
    end
    local ok2, err = pcall(mod.setup)
    if not ok2 then
      vim.notify('matugen: reload setup() failed: ' .. tostring(err), vim.log.levels.ERROR)
    end
  end))
end)

if not ok_signal then
  vim.notify('matugen: SIGUSR1 live-reload unavailable: ' .. tostring(signal_err), vim.log.levels.WARN)
end

return M
