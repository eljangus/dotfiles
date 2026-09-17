-- noctalia -> Neovim colorscheme. Generated into ~/.config/nvim/lua/matugen.lua
-- on every wallpaper / light-dark change; do not edit that copy, edit the
-- template. A running Neovim is refreshed live via SIGUSR1 (see apply.sh).
--
-- Every colour is a Material 3 role from noctalia (surfaces, on_surface,
-- outline, primary/secondary/tertiary/error, inverse_primary) or a blend of
-- two of them. Both the light and dark maps are embedded so M.setup() can
-- repaint either way with no regeneration.
--
-- Heads-up: a palette from a single wallpaper is often near-monochrome.
-- noctalia's default `m3-content` scheme is the worst for this (primary and
-- secondary can be identical), so functions/keywords/types collapse to one
-- hue. Set wallpaper_scheme to m3-tonal-spot / m3-vibrant / m3-expressive
-- for a real spread. See README.md.

local M = {}

M.material = {
  dark = {
    surface                   = '{{colors.surface.dark.hex}}',
    surface_dim               = '{{colors.surface_dim.dark.hex}}',
    surface_bright            = '{{colors.surface_bright.dark.hex}}',
    surface_container_lowest  = '{{colors.surface_container_lowest.dark.hex}}',
    surface_container_low     = '{{colors.surface_container_low.dark.hex}}',
    surface_container         = '{{colors.surface_container.dark.hex}}',
    surface_container_high    = '{{colors.surface_container_high.dark.hex}}',
    surface_container_highest = '{{colors.surface_container_highest.dark.hex}}',
    on_surface                = '{{colors.on_surface.dark.hex}}',
    on_surface_variant        = '{{colors.on_surface_variant.dark.hex}}',
    outline                   = '{{colors.outline.dark.hex}}',
    outline_variant           = '{{colors.outline_variant.dark.hex}}',
    primary                   = '{{colors.primary.dark.hex}}',
    on_primary                = '{{colors.on_primary.dark.hex}}',
    primary_container         = '{{colors.primary_container.dark.hex}}',
    secondary                 = '{{colors.secondary.dark.hex}}',
    on_secondary              = '{{colors.on_secondary.dark.hex}}',
    secondary_container       = '{{colors.secondary_container.dark.hex}}',
    tertiary                  = '{{colors.tertiary.dark.hex}}',
    on_tertiary               = '{{colors.on_tertiary.dark.hex}}',
    tertiary_container        = '{{colors.tertiary_container.dark.hex}}',
    error                     = '{{colors.error.dark.hex}}',
    on_error                  = '{{colors.on_error.dark.hex}}',
    inverse_surface           = '{{colors.inverse_surface.dark.hex}}',
    inverse_on_surface        = '{{colors.inverse_on_surface.dark.hex}}',
    inverse_primary           = '{{colors.inverse_primary.dark.hex}}',
    term = {
      black   = '{{colors.terminal_normal_black.dark.hex}}',
      red     = '{{colors.terminal_normal_red.dark.hex}}',
      green   = '{{colors.terminal_normal_green.dark.hex}}',
      yellow  = '{{colors.terminal_normal_yellow.dark.hex}}',
      blue    = '{{colors.terminal_normal_blue.dark.hex}}',
      magenta = '{{colors.terminal_normal_magenta.dark.hex}}',
      cyan    = '{{colors.terminal_normal_cyan.dark.hex}}',
      white   = '{{colors.terminal_normal_white.dark.hex}}',
      bright_black   = '{{colors.terminal_bright_black.dark.hex}}',
      bright_red     = '{{colors.terminal_bright_red.dark.hex}}',
      bright_green   = '{{colors.terminal_bright_green.dark.hex}}',
      bright_yellow  = '{{colors.terminal_bright_yellow.dark.hex}}',
      bright_blue    = '{{colors.terminal_bright_blue.dark.hex}}',
      bright_magenta = '{{colors.terminal_bright_magenta.dark.hex}}',
      bright_cyan    = '{{colors.terminal_bright_cyan.dark.hex}}',
      bright_white   = '{{colors.terminal_bright_white.dark.hex}}',
      bg          = '{{colors.terminal_background.dark.hex}}',
      fg          = '{{colors.terminal_foreground.dark.hex}}',
      cursor      = '{{colors.terminal_cursor.dark.hex}}',
      cursor_text = '{{colors.terminal_cursor_text.dark.hex}}',
      selection   = '{{colors.terminal_selection_bg.dark.hex}}',
    },
  },
  light = {
    surface                   = '{{colors.surface.light.hex}}',
    surface_dim               = '{{colors.surface_dim.light.hex}}',
    surface_bright            = '{{colors.surface_bright.light.hex}}',
    surface_container_lowest  = '{{colors.surface_container_lowest.light.hex}}',
    surface_container_low     = '{{colors.surface_container_low.light.hex}}',
    surface_container         = '{{colors.surface_container.light.hex}}',
    surface_container_high    = '{{colors.surface_container_high.light.hex}}',
    surface_container_highest = '{{colors.surface_container_highest.light.hex}}',
    on_surface                = '{{colors.on_surface.light.hex}}',
    on_surface_variant        = '{{colors.on_surface_variant.light.hex}}',
    outline                   = '{{colors.outline.light.hex}}',
    outline_variant           = '{{colors.outline_variant.light.hex}}',
    primary                   = '{{colors.primary.light.hex}}',
    on_primary                = '{{colors.on_primary.light.hex}}',
    primary_container         = '{{colors.primary_container.light.hex}}',
    secondary                 = '{{colors.secondary.light.hex}}',
    on_secondary              = '{{colors.on_secondary.light.hex}}',
    secondary_container       = '{{colors.secondary_container.light.hex}}',
    tertiary                  = '{{colors.tertiary.light.hex}}',
    on_tertiary               = '{{colors.on_tertiary.light.hex}}',
    tertiary_container        = '{{colors.tertiary_container.light.hex}}',
    error                     = '{{colors.error.light.hex}}',
    on_error                  = '{{colors.on_error.light.hex}}',
    inverse_surface           = '{{colors.inverse_surface.light.hex}}',
    inverse_on_surface        = '{{colors.inverse_on_surface.light.hex}}',
    inverse_primary           = '{{colors.inverse_primary.light.hex}}',
    term = {
      black   = '{{colors.terminal_normal_black.light.hex}}',
      red     = '{{colors.terminal_normal_red.light.hex}}',
      green   = '{{colors.terminal_normal_green.light.hex}}',
      yellow  = '{{colors.terminal_normal_yellow.light.hex}}',
      blue    = '{{colors.terminal_normal_blue.light.hex}}',
      magenta = '{{colors.terminal_normal_magenta.light.hex}}',
      cyan    = '{{colors.terminal_normal_cyan.light.hex}}',
      white   = '{{colors.terminal_normal_white.light.hex}}',
      bright_black   = '{{colors.terminal_bright_black.light.hex}}',
      bright_red     = '{{colors.terminal_bright_red.light.hex}}',
      bright_green   = '{{colors.terminal_bright_green.light.hex}}',
      bright_yellow  = '{{colors.terminal_bright_yellow.light.hex}}',
      bright_blue    = '{{colors.terminal_bright_blue.light.hex}}',
      bright_magenta = '{{colors.terminal_bright_magenta.light.hex}}',
      bright_cyan    = '{{colors.terminal_bright_cyan.light.hex}}',
      bright_white   = '{{colors.terminal_bright_white.light.hex}}',
      bg          = '{{colors.terminal_background.light.hex}}',
      fg          = '{{colors.terminal_foreground.light.hex}}',
      cursor      = '{{colors.terminal_cursor.light.hex}}',
      cursor_text = '{{colors.terminal_cursor_text.light.hex}}',
      selection   = '{{colors.terminal_selection_bg.light.hex}}',
    },
  },
}

-- `.default` follows the live mode, so it equals `.light` iff noctalia is light.
M.noctalia_mode = ('{{colors.surface.default.hex}}' == '{{colors.surface.light.hex}}') and 'light' or 'dark'

-- ---------------------------------------------------------------- colour maths

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

-- Nudge `c` toward `ink` in small steps until it clears `min:1` contrast on
-- `bg`, preserving hue. Used to rescue a role that lands on top of the
-- surface in one mode (inverse_primary, mainly).
local function readable(c, bg, ink, min)
  min = min or 3
  local out = c
  for _ = 1, 40 do
    if contrast(out, bg) >= min then
      break
    end
    out = blend(ink, out, 0.1)
  end
  return out
end

local function median3(a, b, c)
  local t = { a, b, c }
  table.sort(t)
  return t[2]
end

local function resolve_mode()
  if M.noctalia_mode == 'light' or M.noctalia_mode == 'dark' then
    return M.noctalia_mode
  end
  return luminance(M.material.light.surface) > 0.5 and 'light' or 'dark'
end

-- ---------------------------------------------------------------------- palette
-- Six accent slots. primary/secondary/tertiary/error are the Material accents
-- verbatim.
--
-- `accent` is inverse_primary, which Material tunes for the *inverse* surface,
-- so on our own background it almost always needs pulling onto a readable
-- contrast. Nudge it toward a saturated ink -- on_surface already is one in
-- light; in dark it is near-grey, so fold primary in -- and aim for the median
-- contrast primary/secondary/tertiary hit against the surface. Headings cycle
-- through accent plus those three, so this keeps every level about equally
-- prominent, and dark lands in the same contrast band as light instead of
-- trailing it.
--
-- `*_soft` are aliases of secondary/tertiary in BOTH modes. The light theme is
-- the more colourful, higher-contrast one precisely because it never drags a
-- role toward the fg/bg -- it just uses the Material tones as given. Dark used
-- to lighten `*_soft` toward on_surface for a spare shade, but on_surface is
-- near-white there, so the blend bled the chroma out (a green `tertiary_soft`
-- came out grey-blue). Dark now follows the same rule: fewer distinct hues
-- than a hand-tuned scheme, but every one of them keeps its colour.
local function make_palette(mode)
  local m = M.material[mode]
  local dark = mode == 'dark'
  local base, text = m.surface, m.on_surface

  local primary = m.primary
  local err = m.error
  local tertiary = m.tertiary
  local secondary = m.secondary
  local accent_ink = dark and blend(m.primary, text, 0.5) or text
  local accent = readable(m.inverse_primary, base, accent_ink,
    median3(contrast(primary, base), contrast(secondary, base), contrast(tertiary, base)))
  local secondary_soft = m.secondary
  local tertiary_soft = m.tertiary

  local ink_lo = M.material.dark.surface_container_lowest
  local ink_hi = M.material.light.surface_container_lowest
  -- pick whichever ink actually reads on `c`, not a luminance guess -- a
  -- mid-luminance accent like a lavender secondary would otherwise take the
  -- light ink and vanish.
  local function on(c)
    return contrast(ink_lo, c) >= contrast(ink_hi, c) and ink_lo or ink_hi
  end

  return {
    none = 'NONE',
    base = base,
    surface = m.surface_container_low,
    overlay = m.surface_container_high,
    -- Tabline / bufferline chrome, stepped up the first three container rungs:
    -- active buffer tab at _lowest (reads as part of the editor), inactive tabs
    -- at _low, empty fill at surface_container. Same roles in both modes -- the
    -- ramp runs darker with elevation in light and lighter in dark. NOTE: the
    -- fill barely clears neo-tree here (neo-tree is _low); if the header looks
    -- muddy, bump nc/tab_bg one rung to surface_container_high/surface_container.
    nc = m.surface_container,
    tab_bg = m.surface_container_low,
    tab_sel = m.surface_container_lowest,
    -- a real drop shadow: dark in both themes, never the tabline tone
    shadow = M.material.dark.surface_dim,
    hl_low = blend(text, base, dark and 0.05 or 0.045),
    hl_med = m.surface_container_high,
    hl_high = m.surface_container_highest,

    text = text,
    subtle = m.on_surface_variant,
    muted = m.outline,
    faint = blend(m.outline, base, 0.55),

    err = err,
    primary = primary,
    tertiary = tertiary,
    secondary = secondary,
    secondary_soft = secondary_soft,
    accent = accent,
    tertiary_soft = tertiary_soft,

    primary_bg = m.primary_container,
    secondary_bg = m.secondary_container,
    tertiary_bg = m.tertiary_container,

    on_err = m.on_error,
    on_primary = m.on_primary,
    on_tertiary = m.on_tertiary,
    on_secondary = m.on_secondary,
    on_secondary_soft = on(secondary_soft),
    on_accent = on(accent),
    on_tertiary_soft = on(tertiary_soft),

    inverse = m.inverse_surface,
    on_inverse = m.inverse_on_surface,
    term = m.term,
  }
end

local function make_lualine_theme(p)
  local c = { bg = p.base, fg = p.subtle }
  local function section(hue, on_hue)
    return { a = { bg = hue, fg = on_hue, gui = 'bold' }, b = { bg = p.hl_med, fg = hue }, c = c }
  end
  return {
    normal = section(p.primary, p.on_primary),
    insert = section(p.secondary_soft, p.on_secondary_soft),
    visual = section(p.accent, p.on_accent),
    replace = section(p.err, p.on_err),
    command = section(p.tertiary, p.on_tertiary),
    inactive = {
      a = { bg = p.surface, fg = p.muted, gui = 'bold' },
      b = { bg = p.surface, fg = p.muted },
      c = { bg = p.base, fg = p.muted },
    },
  }
end

_G.__matugen_opts = _G.__matugen_opts or {}
M.transparent = _G.__matugen_opts.transparent == true

M.palette = make_palette(resolve_mode())
local lualine_theme = make_lualine_theme(M.palette)

function M.get_palette()
  return M.palette
end

function M.get_lualine_theme()
  return lualine_theme
end

-- -------------------------------------------------------------------- highlights
local function build(p, transparent)
  local ed = transparent and 'NONE' or p.base
  local fl = transparent and 'NONE' or p.surface
  local eob = ed == 'NONE' and p.base or ed
  local git_add, git_change, git_delete = p.secondary, p.tertiary, p.err

  -- h1..h6 walk all six accent slots so nested headings stay distinct; shared
  -- by @markup.heading.N, the builtin markdown groups and render-markdown.
  local heading_hue = { p.accent, p.secondary_soft, p.primary, p.tertiary, p.secondary, p.tertiary_soft }

  local t = {}

  local term_bg = transparent and 'NONE' or p.term.bg
  -- editor UI
  t.Normal = { fg = p.text, bg = ed }
  t.NormalNC = { fg = p.text, bg = ed }
  t.NormalFloat = { fg = p.text, bg = fl }
  t.NormalTerminal = { fg = p.term.fg, bg = term_bg }
  t.Terminal = { fg = p.term.fg, bg = term_bg }
  t.TerminalBorder = { fg = p.muted, bg = term_bg }
  t.FloatBorder = { fg = p.muted, bg = fl }
  t.FloatTitle = { fg = p.secondary_soft, bg = fl, bold = true }
  t.FloatFooter = { fg = p.muted, bg = fl }
  t.ColorColumn = { bg = p.surface }
  t.Conceal = { bg = 'NONE' }
  t.Cursor = { fg = p.base, bg = p.text }
  t.lCursor = { link = 'Cursor' }
  t.CursorIM = { link = 'Cursor' }
  t.TermCursor = { fg = p.term.cursor_text, bg = p.term.cursor }
  t.TermCursorNC = { fg = p.term.cursor_text, bg = p.subtle }
  t.CursorColumn = { bg = p.overlay }
  t.CursorLine = { bg = p.overlay }
  t.CursorLineNr = { fg = p.text, bold = true }
  t.CursorLineSign = { bg = p.overlay }
  t.CursorLineFold = { bg = p.overlay }
  t.LineNr = { fg = p.faint }
  t.LineNrAbove = { fg = p.faint }
  t.LineNrBelow = { fg = p.faint }
  t.SignColumn = { fg = p.text, bg = 'NONE' }
  t.FoldColumn = { fg = p.muted, bg = 'NONE' }
  t.Folded = { fg = p.subtle, bg = p.hl_low }
  t.EndOfBuffer = { fg = eob }
  t.NonText = { fg = p.faint }
  t.Whitespace = { fg = p.faint }
  t.SpecialKey = { fg = p.secondary_soft }
  t.MatchParen = { fg = p.tertiary, bg = p.hl_med, bold = true }
  local visual_bg = blend(p.accent, p.base, 0.24)
  t.Visual = { bg = visual_bg }
  t.VisualNOS = { bg = visual_bg }
  t.Search = { fg = p.text, bg = blend(p.tertiary, p.base, 0.3) }
  t.IncSearch = { fg = p.on_tertiary, bg = p.tertiary }
  t.CurSearch = { fg = p.on_tertiary, bg = p.tertiary }
  t.Substitute = { fg = p.on_err, bg = p.err }
  t.Pmenu = { fg = p.subtle, bg = fl }
  t.PmenuSel = { fg = p.text, bg = p.overlay, bold = true }
  t.PmenuKind = { fg = p.secondary_soft, bg = fl }
  t.PmenuKindSel = { fg = p.secondary_soft, bg = p.overlay }
  t.PmenuExtra = { fg = p.muted, bg = fl }
  t.PmenuExtraSel = { fg = p.subtle, bg = p.overlay }
  t.PmenuSbar = { bg = p.surface }
  t.PmenuThumb = { bg = p.muted }
  t.PmenuMatch = { fg = p.tertiary, bg = fl, bold = true }
  t.PmenuMatchSel = { fg = p.tertiary, bg = p.overlay, bold = true }
  t.WildMenu = { link = 'IncSearch' }
  t.QuickFixLine = { bg = p.hl_low, bold = true }
  t.Directory = { fg = p.secondary_soft, bold = true }
  t.Title = { fg = p.secondary_soft, bold = true }
  t.ModeMsg = { fg = p.subtle }
  t.MsgArea = { fg = p.text }
  t.MsgSeparator = { fg = p.muted, bg = ed }
  t.MoreMsg = { fg = p.accent }
  t.Question = { fg = p.tertiary }
  t.ErrorMsg = { fg = p.err, bold = true }
  t.WarningMsg = { fg = p.tertiary, bold = true }
  t.NvimInternalError = { link = 'ErrorMsg' }
  t.WinBar = { fg = p.subtle, bg = ed }
  t.WinBarNC = { fg = p.muted, bg = ed }
  t.WinSeparator = { fg = p.muted, bg = ed }
  t.VertSplit = { fg = p.muted, bg = ed }
  t.StatusLine = { fg = p.subtle, bg = p.surface }
  t.StatusLineNC = { fg = p.muted, bg = p.surface }
  t.StatusLineTerm = { fg = p.subtle, bg = p.surface }
  t.StatusLineTermNC = { fg = p.muted, bg = p.surface }
  t.TabLine = { fg = p.subtle, bg = p.nc }
  t.TabLineFill = { bg = p.nc }
  t.TabLineSel = { fg = p.text, bg = ed, bold = true }
  t.FloatShadow = { bg = p.shadow, blend = 40 }
  t.FloatShadowThrough = { bg = p.shadow, blend = 100 }
  t.Debug = { fg = p.primary }
  t.debugPC = { bg = blend(p.secondary, p.base, 0.2) }
  t.debugBreakpoint = { fg = p.err }

  -- spelling
  t.SpellBad = { sp = p.err, undercurl = true }
  t.SpellCap = { sp = p.tertiary, undercurl = true }
  t.SpellLocal = { sp = p.secondary_soft, undercurl = true }
  t.SpellRare = { sp = p.accent, undercurl = true }

  -- diff / git status
  t.DiffAdd = { bg = blend(git_add, p.base, 0.16) }
  t.DiffChange = { bg = blend(git_change, p.base, 0.12) }
  t.DiffDelete = { fg = blend(git_delete, p.base, 0.55), bg = blend(git_delete, p.base, 0.14) }
  t.DiffText = { bg = blend(git_change, p.base, 0.3) }
  t.diffAdded = { fg = git_add }
  t.diffChanged = { fg = git_change }
  t.diffRemoved = { fg = git_delete }
  t.diffNewFile = { fg = git_add }
  t.diffOldFile = { fg = git_delete }
  t.diffFile = { fg = p.secondary_soft }
  t.diffLine = { fg = p.accent }
  t.diffIndexLine = { fg = p.muted }
  t.Added = { fg = git_add }
  t.Changed = { fg = git_change }
  t.Removed = { fg = git_delete }

  -- syntax
  t.Comment = { fg = p.subtle, italic = true }
  t.Constant = { fg = p.tertiary }
  t.String = { fg = p.tertiary }
  t.Character = { fg = p.tertiary }
  t.Number = { fg = p.tertiary }
  t.Float = { fg = p.tertiary }
  t.Boolean = { fg = p.primary }
  t.Identifier = { fg = p.text }
  t.Function = { fg = p.primary }
  t.Statement = { fg = p.secondary, bold = true }
  t.Conditional = { fg = p.secondary }
  t.Repeat = { fg = p.secondary }
  t.Label = { fg = p.secondary_soft }
  t.Operator = { fg = p.subtle }
  t.Keyword = { fg = p.secondary }
  t.Exception = { fg = p.secondary }
  t.PreProc = { fg = p.accent }
  t.Include = { fg = p.secondary }
  t.Define = { fg = p.accent }
  t.Macro = { fg = p.accent }
  t.PreCondit = { fg = p.accent }
  t.Type = { fg = p.secondary_soft }
  t.StorageClass = { fg = p.secondary_soft }
  t.Structure = { fg = p.secondary_soft }
  t.Typedef = { fg = p.secondary_soft }
  t.Special = { fg = p.secondary_soft }
  t.SpecialChar = { fg = p.secondary_soft }
  t.Tag = { fg = p.secondary_soft }
  t.Delimiter = { fg = p.subtle }
  t.SpecialComment = { fg = p.accent }
  t.Underlined = { fg = p.accent, underline = true }
  t.Ignore = { fg = p.muted }
  t.Error = { fg = p.err }
  t.Todo = { fg = p.tertiary, bg = blend(p.tertiary, p.base, 0.18), bold = true }
  t.Bold = { bold = true }
  t.Italic = { italic = true }
  t.healthError = { fg = p.err }
  t.healthWarning = { fg = p.tertiary }
  t.healthSuccess = { fg = p.tertiary_soft }
  t.helpHyperTextJump = { fg = p.accent, underline = true }
  t.helpCommand = { fg = p.tertiary }
  t.qfLineNr = { fg = p.muted }
  t.qfFileName = { fg = p.secondary_soft }

  -- diagnostics
  local diag = { Error = p.err, Warn = p.tertiary, Info = p.secondary, Hint = p.accent, Ok = p.tertiary_soft }
  for name, c in pairs(diag) do
    local virt_bg = blend(c, p.base, 0.13)
    t['Diagnostic' .. name] = { fg = c }
    t['DiagnosticSign' .. name] = { fg = c }
    t['DiagnosticDefault' .. name] = { fg = c }
    t['DiagnosticFloating' .. name] = { fg = c }
    t['DiagnosticVirtualText' .. name] = { fg = c, bg = virt_bg }
    t['DiagnosticVirtualLines' .. name] = { fg = c, bg = virt_bg }
    t['DiagnosticUnderline' .. name] = { sp = c, undercurl = true }
  end
  t.DiagnosticUnnecessary = { fg = p.muted }
  t.DiagnosticDeprecated = { fg = p.muted, strikethrough = true }

  -- LSP
  t.LspReferenceText = { bg = p.hl_med }
  t.LspReferenceRead = { bg = p.hl_med }
  t.LspReferenceWrite = { bg = p.hl_med, underline = true }
  t.LspSignatureActiveParameter = { fg = p.tertiary, bg = p.hl_med }
  t.LspCodeLens = { fg = p.muted, italic = true }
  t.LspCodeLensSeparator = { fg = p.faint }
  t.LspInlayHint = { fg = p.muted, bg = blend(p.muted, p.base, 0.12), italic = true }
  t.LspInfoBorder = { fg = p.muted, bg = fl }

  -- tree-sitter
  t['@variable'] = { fg = p.text }
  t['@variable.builtin'] = { fg = p.err, italic = true }
  t['@variable.parameter'] = { fg = p.accent, italic = true }
  t['@variable.parameter.builtin'] = { fg = p.accent, italic = true, bold = true }
  t['@variable.member'] = { fg = p.secondary_soft }
  t['@constant'] = { fg = p.tertiary }
  t['@constant.builtin'] = { fg = p.tertiary, bold = true }
  t['@constant.macro'] = { fg = p.accent }
  t['@module'] = { fg = p.text }
  t['@module.builtin'] = { fg = p.text, bold = true }
  t['@label'] = { fg = p.secondary_soft }
  t['@string'] = { link = 'String' }
  t['@string.documentation'] = { fg = p.tertiary, italic = true }
  t['@string.regexp'] = { fg = p.accent }
  t['@string.escape'] = { fg = p.secondary }
  t['@string.special'] = { fg = p.secondary_soft }
  t['@string.special.symbol'] = { fg = p.text }
  t['@string.special.url'] = { fg = p.accent, underline = true }
  t['@string.special.path'] = { fg = p.secondary_soft }
  t['@character'] = { link = 'Character' }
  t['@character.special'] = { fg = p.secondary_soft }
  t['@boolean'] = { link = 'Boolean' }
  t['@number'] = { link = 'Number' }
  t['@number.float'] = { link = 'Float' }
  t['@type'] = { fg = p.secondary_soft }
  t['@type.builtin'] = { fg = p.secondary_soft, bold = true }
  t['@type.definition'] = { fg = p.secondary_soft }
  t['@type.qualifier'] = { fg = p.secondary }
  t['@attribute'] = { fg = p.accent }
  t['@attribute.builtin'] = { fg = p.accent, bold = true }
  t['@property'] = { fg = p.secondary_soft, italic = true }
  t['@function'] = { fg = p.primary }
  t['@function.builtin'] = { fg = p.primary, italic = true }
  t['@function.call'] = { fg = p.primary }
  t['@function.macro'] = { fg = p.accent }
  t['@function.method'] = { fg = p.primary }
  t['@function.method.call'] = { fg = p.primary }
  t['@constructor'] = { fg = p.secondary_soft }
  t['@operator'] = { fg = p.subtle }
  t['@keyword'] = { fg = p.secondary }
  t['@keyword.coroutine'] = { fg = p.secondary }
  t['@keyword.function'] = { fg = p.secondary }
  t['@keyword.operator'] = { fg = p.subtle }
  t['@keyword.import'] = { fg = p.secondary }
  t['@keyword.type'] = { fg = p.secondary }
  t['@keyword.modifier'] = { fg = p.secondary }
  t['@keyword.storage'] = { fg = p.secondary_soft }
  t['@keyword.repeat'] = { fg = p.secondary }
  t['@keyword.return'] = { fg = p.secondary, italic = true }
  t['@keyword.debug'] = { fg = p.primary }
  t['@keyword.exception'] = { fg = p.secondary }
  t['@keyword.conditional'] = { fg = p.secondary }
  t['@keyword.conditional.ternary'] = { fg = p.subtle }
  t['@keyword.directive'] = { fg = p.accent }
  t['@keyword.directive.define'] = { fg = p.accent }
  t['@punctuation.delimiter'] = { fg = p.subtle }
  t['@punctuation.bracket'] = { fg = p.subtle }
  t['@punctuation.special'] = { fg = p.secondary_soft }
  t['@comment'] = { link = 'Comment' }
  t['@comment.documentation'] = { fg = p.faint, italic = true }
  t['@comment.error'] = { fg = p.base, bg = p.err, bold = true }
  t['@comment.warning'] = { fg = p.base, bg = p.tertiary, bold = true }
  t['@comment.todo'] = { fg = p.base, bg = p.accent, bold = true }
  t['@comment.note'] = { fg = p.base, bg = p.secondary_soft, bold = true }
  t['@markup.strong'] = { bold = true }
  t['@markup.italic'] = { italic = true }
  t['@markup.strikethrough'] = { strikethrough = true }
  t['@markup.underline'] = { underline = true }
  t['@markup.heading'] = { fg = p.secondary_soft, bold = true }
  for i = 1, 6 do
    t['@markup.heading.' .. i] = { fg = heading_hue[i], bold = true }
  end
  t['@markup.quote'] = { fg = p.subtle, italic = true }
  t['@markup.math'] = { fg = p.secondary_soft }
  t['@markup.link'] = { fg = p.accent }
  t['@markup.link.label'] = { fg = p.secondary_soft }
  t['@markup.link.url'] = { fg = p.accent, underline = true }
  t['@markup.raw'] = { fg = p.tertiary }
  t['@markup.raw.block'] = { bg = p.hl_low }
  t['@markup.raw.markdown_inline'] = { fg = p.tertiary, bg = p.hl_low }
  t['@markup.list'] = { fg = p.secondary }
  t['@markup.list.checked'] = { fg = p.tertiary_soft }
  t['@markup.list.unchecked'] = { fg = p.subtle }
  t['@diff.plus'] = { fg = git_add, bg = blend(git_add, p.base, 0.14) }
  t['@diff.minus'] = { fg = git_delete, bg = blend(git_delete, p.base, 0.14) }
  t['@diff.delta'] = { bg = blend(git_change, p.base, 0.14) }
  t['@tag'] = { fg = p.secondary_soft }
  t['@tag.builtin'] = { fg = p.secondary_soft, bold = true }
  t['@tag.attribute'] = { fg = p.accent, italic = true }
  t['@tag.delimiter'] = { fg = p.subtle }
  t['@none'] = {}
  t['@conceal'] = { link = 'Conceal' }
  t['@spell'] = {}
  t['@nospell'] = {}
  for i = 1, 6 do
    t['@markup.heading.' .. i .. '.markdown'] = { link = 'markdownH' .. i }
    t['@markup.heading.' .. i .. '.marker.markdown'] = { link = 'markdownH' .. i .. 'Delimiter' }
  end

  -- LSP semantic tokens
  t['@lsp.type.class'] = { link = '@type' }
  t['@lsp.type.comment'] = {}
  t['@lsp.type.decorator'] = { link = '@attribute' }
  t['@lsp.type.enum'] = { link = '@type' }
  t['@lsp.type.enumMember'] = { link = '@constant' }
  t['@lsp.type.event'] = { link = '@type' }
  t['@lsp.type.interface'] = { link = '@type' }
  t['@lsp.type.keyword'] = { link = '@keyword' }
  t['@lsp.type.macro'] = { link = '@function.macro' }
  t['@lsp.type.method'] = { link = '@function.method' }
  t['@lsp.type.modifier'] = { link = '@keyword.modifier' }
  t['@lsp.type.namespace'] = { link = '@module' }
  t['@lsp.type.parameter'] = { link = '@variable.parameter' }
  t['@lsp.type.property'] = { link = '@property' }
  t['@lsp.type.struct'] = { link = '@type' }
  t['@lsp.type.type'] = { link = '@type' }
  t['@lsp.type.typeParameter'] = { link = '@type.definition' }
  t['@lsp.type.variable'] = {}
  t['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' }
  t['@lsp.typemod.method.defaultLibrary'] = { link = '@function.builtin' }
  t['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' }
  t['@lsp.typemod.variable.readonly'] = { link = '@constant' }
  t['@lsp.typemod.variable.globalScope'] = { fg = p.text, bold = true }
  t['@lsp.typemod.property.readonly'] = { link = '@property' }
  t['@lsp.typemod.string.injected'] = { link = '@string' }
  t['@lsp.typemod.operator.injected'] = { link = '@operator' }
  t['@lsp.typemod.keyword.injected'] = { link = '@keyword' }
  t['@lsp.typemod.variable.injected'] = { link = '@variable' }

  -- markdown / html builtin syntax
  for i = 1, 6 do
    t['markdownH' .. i] = { fg = heading_hue[i], bold = true }
    t['markdownH' .. i .. 'Delimiter'] = { fg = heading_hue[i], bold = true }
  end
  t.markdownCode = { fg = p.tertiary }
  t.markdownCodeBlock = { fg = p.tertiary }
  t.markdownCodeDelimiter = { fg = p.subtle }
  t.markdownLinkText = { fg = p.accent, underline = true }
  t.markdownUrl = { fg = p.accent, underline = true }
  t.markdownLinkDelimiter = { fg = p.subtle }
  t.markdownListMarker = { fg = p.primary }
  t.markdownRule = { fg = p.muted }
  t.markdownBlockquote = { fg = p.subtle, italic = true }
  t.markdownHeadingDelimiter = { fg = p.muted }
  t.mkdCode = { fg = p.tertiary }
  t.mkdCodeDelimiter = { fg = p.subtle }
  t.mkdCodeStart = { fg = p.tertiary }
  t.mkdCodeEnd = { fg = p.tertiary }
  t.mkdLink = { fg = p.accent, underline = true }
  t.mkdURL = { fg = p.accent, underline = true }
  t.mkdListItem = { fg = p.primary }
  t.htmlTag = { fg = p.subtle }
  t.htmlEndTag = { fg = p.subtle }
  t.htmlTagName = { fg = p.secondary_soft }
  t.htmlArg = { fg = p.accent }
  t.htmlBold = { bold = true }
  t.htmlItalic = { italic = true }
  t.htmlLink = { fg = p.accent, underline = true }
  for i = 1, 6 do
    t['htmlH' .. i] = { link = 'markdownH' .. i }
  end

  -- gitsigns.nvim
  t.GitSignsAdd = { fg = git_add }
  t.GitSignsChange = { fg = git_change }
  t.GitSignsDelete = { fg = git_delete }
  t.GitSignsAddNr = { fg = git_add }
  t.GitSignsChangeNr = { fg = git_change }
  t.GitSignsDeleteNr = { fg = git_delete }
  t.GitSignsAddLn = { bg = blend(git_add, p.base, 0.12) }
  t.GitSignsChangeLn = { bg = blend(git_change, p.base, 0.12) }
  t.GitSignsDeleteLn = { bg = blend(git_delete, p.base, 0.12) }
  t.GitSignsAddInline = { bg = blend(git_add, p.base, 0.3) }
  t.GitSignsChangeInline = { bg = blend(git_change, p.base, 0.3) }
  t.GitSignsDeleteInline = { bg = blend(git_delete, p.base, 0.3) }
  t.GitSignsAddPreview = { bg = blend(git_add, p.base, 0.14) }
  t.GitSignsDeletePreview = { bg = blend(git_delete, p.base, 0.14) }
  t.GitSignsCurrentLineBlame = { fg = p.faint, italic = true }
  t.GitSignsStagedAdd = { fg = blend(git_add, p.base, 0.6) }
  t.GitSignsStagedChange = { fg = blend(git_change, p.base, 0.6) }
  t.GitSignsStagedDelete = { fg = blend(git_delete, p.base, 0.6) }
  t.SignAdd = { fg = git_add }
  t.SignChange = { fg = git_change }
  t.SignDelete = { fg = git_delete }

  -- telescope.nvim
  t.TelescopeNormal = { fg = p.text, bg = fl }
  t.TelescopeBorder = { fg = p.muted, bg = fl }
  t.TelescopeTitle = { fg = p.subtle }
  t.TelescopePromptNormal = { fg = p.text, bg = fl }
  t.TelescopePromptBorder = { fg = p.muted, bg = fl }
  t.TelescopePromptTitle = { fg = p.on_primary, bg = p.primary, bold = true }
  t.TelescopePromptPrefix = { fg = p.primary }
  t.TelescopePromptCounter = { fg = p.subtle }
  t.TelescopeResultsNormal = { fg = p.subtle, bg = fl }
  t.TelescopeResultsBorder = { fg = p.muted, bg = fl }
  t.TelescopeResultsTitle = { fg = p.on_secondary, bg = p.secondary, bold = true }
  t.TelescopePreviewNormal = { fg = p.text, bg = fl }
  t.TelescopePreviewBorder = { fg = p.muted, bg = fl }
  t.TelescopePreviewTitle = { fg = p.on_tertiary, bg = p.tertiary, bold = true }
  t.TelescopeSelection = { fg = p.text, bg = p.overlay }
  t.TelescopeSelectionCaret = { fg = p.primary, bg = p.overlay }
  t.TelescopeMultiSelection = { fg = p.accent }
  t.TelescopeMatching = { fg = p.tertiary, bold = true }

  -- which-key.nvim / mini.icons
  t.WhichKey = { fg = p.primary }
  t.WhichKeyGroup = { fg = p.secondary_soft }
  t.WhichKeyDesc = { fg = p.text }
  t.WhichKeySeparator = { fg = p.faint }
  t.WhichKeyValue = { fg = p.subtle }
  t.WhichKeyFloat = { bg = fl }
  t.WhichKeyNormal = { bg = fl }
  t.WhichKeyBorder = { fg = p.muted, bg = fl }
  t.WhichKeyTitle = { fg = p.secondary_soft, bg = fl, bold = true }
  t.WhichKeyIcon = { fg = p.secondary_soft }
  local icon_hue = {
    Azure = p.secondary, Blue = p.secondary, Cyan = p.secondary_soft, Green = p.tertiary_soft, Grey = p.subtle,
    Orange = p.tertiary, Purple = p.accent, Red = p.err, Yellow = p.tertiary,
  }
  for name, c in pairs(icon_hue) do
    t['WhichKeyIcon' .. name] = { fg = c }
    t['MiniIcons' .. name] = { fg = c }
  end

  -- neo-tree.nvim
  t.NeoTreeNormal = { fg = p.text, bg = fl }
  t.NeoTreeNormalNC = { fg = p.text, bg = fl }
  t.NeoTreeWinSeparator = { fg = p.muted, bg = ed }
  t.NeoTreeEndOfBuffer = { fg = fl == 'NONE' and p.base or fl }
  t.NeoTreeRootName = { fg = p.secondary_soft, bold = true }
  t.NeoTreeTitleBar = { fg = p.on_primary, bg = p.primary, bold = true }
  t.NeoTreeDirectoryName = { fg = p.primary, bold = true }
  t.NeoTreeDirectoryIcon = { fg = p.primary }
  t.NeoTreeFileName = { fg = p.text }
  t.NeoTreeFileIcon = { fg = p.subtle }
  t.NeoTreeFileNameOpened = { fg = p.tertiary }
  t.NeoTreeIndentMarker = { fg = p.faint }
  t.NeoTreeExpander = { fg = p.muted }
  t.NeoTreeDotfile = { fg = p.muted }
  t.NeoTreeHiddenByName = { fg = p.muted }
  t.NeoTreeCursorLine = { bg = p.overlay }
  t.NeoTreeFileNameHover = { fg = p.text, bg = blend(p.accent, p.base, 0.1) }
  t.NeoTreeFloatBorder = { fg = p.muted, bg = fl }
  t.NeoTreeFloatTitle = { fg = p.secondary_soft, bg = fl, bold = true }
  t.NeoTreeTabActive = { fg = p.text, bg = fl, bold = true }
  t.NeoTreeTabInactive = { fg = p.muted, bg = p.nc }
  t.NeoTreeTabSeparatorActive = { fg = p.primary, bg = fl }
  t.NeoTreeTabSeparatorInactive = { fg = p.nc, bg = p.nc }
  t.NeoTreeGitAdded = { fg = git_add }
  t.NeoTreeGitModified = { fg = git_change }
  t.NeoTreeGitDeleted = { fg = git_delete }
  t.NeoTreeGitRenamed = { fg = p.accent }
  t.NeoTreeGitStaged = { fg = p.tertiary_soft }
  t.NeoTreeGitUnstaged = { fg = p.tertiary }
  t.NeoTreeGitUntracked = { fg = p.accent, italic = true }
  t.NeoTreeGitConflict = { fg = p.err, bold = true }
  t.NeoTreeGitIgnored = { fg = p.muted }
  t.NeoTreeMessage = { fg = p.muted, italic = true }
  t.NeoTreeModified = { fg = p.tertiary }

  -- diffview.nvim
  t.DiffviewNormal = { link = 'NormalFloat' }
  t.DiffviewStatusLine = { fg = p.subtle, bg = p.surface }
  t.DiffviewWinSeparator = { fg = p.muted, bg = ed }
  t.DiffviewFilePanelRootPath = { fg = p.muted }
  t.DiffviewFilePanelPath = { fg = p.muted }
  t.DiffviewFilePanelTitle = { fg = p.secondary_soft, bold = true }
  t.DiffviewFilePanelCounter = { fg = p.accent, bold = true }
  t.DiffviewFilePanelFileName = { fg = p.text }
  t.DiffviewFilePanelSelected = { fg = p.tertiary, bold = true }
  t.DiffviewFilePanelInsertions = { fg = git_add }
  t.DiffviewFilePanelDeletions = { fg = git_delete }
  t.DiffviewFilePanelConflicts = { fg = p.err }
  t.DiffviewStatusAdded = { fg = git_add }
  t.DiffviewStatusModified = { fg = git_change }
  t.DiffviewStatusRenamed = { fg = p.accent }
  t.DiffviewStatusDeleted = { fg = git_delete }
  t.DiffviewStatusUnknown = { fg = p.muted }
  t.DiffviewStatusUntracked = { fg = p.accent }
  t.DiffviewFolderName = { fg = p.secondary_soft }
  t.DiffviewFolderSign = { fg = p.subtle }
  t.DiffviewHash = { fg = p.tertiary }
  t.DiffviewReference = { fg = p.accent, bold = true }
  t.DiffviewPrimary = { fg = p.primary }
  t.DiffviewSecondary = { fg = p.secondary_soft }
  t.DiffviewDim1 = { fg = p.faint }
  t.DiffviewNonText = { fg = p.faint }

  -- blink.cmp / nvim-cmp / lspkind / nvim-navic
  t.BlinkCmpMenu = { fg = p.subtle, bg = fl }
  t.BlinkCmpMenuBorder = { fg = p.muted, bg = fl }
  t.BlinkCmpMenuSelection = { fg = p.text, bg = p.overlay, bold = true }
  t.BlinkCmpScrollBarThumb = { bg = p.muted }
  t.BlinkCmpScrollBarGutter = { bg = p.surface }
  t.BlinkCmpLabel = { fg = p.subtle }
  t.BlinkCmpLabelMatch = { fg = p.tertiary, bold = true }
  t.BlinkCmpLabelDeprecated = { fg = p.faint, strikethrough = true }
  t.BlinkCmpLabelDetail = { fg = p.muted }
  t.BlinkCmpLabelDescription = { fg = p.muted }
  t.BlinkCmpKind = { fg = p.secondary_soft }
  t.BlinkCmpKindDefault = { fg = p.secondary_soft }
  t.BlinkCmpSource = { fg = p.muted }
  t.BlinkCmpGhostText = { fg = p.faint, italic = true }
  t.BlinkCmpDoc = { fg = p.text, bg = fl }
  t.BlinkCmpDocBorder = { fg = p.muted, bg = fl }
  t.BlinkCmpDocSeparator = { fg = p.muted, bg = fl }
  t.BlinkCmpSignatureHelp = { fg = p.text, bg = fl }
  t.BlinkCmpSignatureHelpBorder = { fg = p.muted, bg = fl }
  t.BlinkCmpSignatureHelpActiveParameter = { fg = p.tertiary, bg = p.hl_med }
  local kind_hue = {
    Text = p.secondary, Method = p.primary, Function = p.primary, Constructor = p.secondary_soft,
    Field = p.secondary_soft, Variable = p.text, Property = p.secondary_soft, Class = p.tertiary,
    Interface = p.tertiary, Struct = p.secondary_soft, Module = p.secondary_soft, Enum = p.tertiary,
    EnumMember = p.secondary_soft, Constant = p.tertiary, Value = p.tertiary, Keyword = p.secondary,
    Snippet = p.accent, Color = p.err, File = p.secondary_soft, Reference = p.accent,
    Folder = p.secondary_soft, Event = p.tertiary, Operator = p.subtle, Unit = p.tertiary,
    TypeParameter = p.accent, Codeium = p.secondary_soft, Copilot = p.secondary_soft,
    Supermaven = p.secondary_soft, TabNine = p.secondary_soft,
  }
  for kind, c in pairs(kind_hue) do
    t['BlinkCmpKind' .. kind] = { fg = c }
    t['CmpItemKind' .. kind] = { fg = c }
    t['LspKind' .. kind] = { fg = c }
    t['NavicIcons' .. kind] = { fg = c }
  end
  t.CmpItemAbbr = { fg = p.subtle }
  t.CmpItemAbbrMatch = { fg = p.tertiary, bold = true }
  t.CmpItemAbbrMatchFuzzy = { fg = p.tertiary, bold = true }
  t.CmpItemAbbrDeprecated = { fg = p.faint, strikethrough = true }
  t.CmpItemMenu = { fg = p.muted }
  t.CmpItemKind = { fg = p.secondary_soft }
  t.NavicText = { fg = p.subtle }
  t.NavicSeparator = { fg = p.muted }

  -- indent-blankline.nvim
  t.IblIndent = { fg = p.faint, nocombine = true }
  t.IblWhitespace = { fg = p.faint, nocombine = true }
  t.IblScope = { fg = p.secondary_soft, nocombine = true }
  t.IndentBlanklineChar = { fg = p.faint, nocombine = true }
  t.IndentBlanklineSpaceChar = { fg = p.faint, nocombine = true }
  t.IndentBlanklineContextChar = { fg = p.secondary_soft, nocombine = true }

  -- fidget.nvim
  t.FidgetTitle = { fg = p.secondary_soft, bold = true }
  t.FidgetTask = { fg = p.subtle }

  -- noice.nvim
  t.NoiceCmdline = { fg = p.text, bg = fl }
  t.NoiceCmdlinePopup = { fg = p.text, bg = fl }
  t.NoiceCmdlinePopupBorder = { fg = p.muted, bg = fl }
  t.NoiceCmdlinePopupTitle = { fg = p.secondary_soft, bold = true }
  t.NoiceCmdlineIcon = { fg = p.accent }
  t.NoiceCmdlineIconSearch = { fg = p.tertiary }
  t.NoiceConfirm = { fg = p.text, bg = fl }
  t.NoiceConfirmBorder = { fg = p.muted, bg = fl }
  t.NoicePopup = { fg = p.text, bg = fl }
  t.NoicePopupBorder = { fg = p.muted, bg = fl }
  t.NoiceMini = { fg = p.subtle, bg = fl }
  t.NoiceVirtualText = { fg = p.faint }
  t.NoiceLspProgressTitle = { fg = p.text }
  t.NoiceLspProgressClient = { fg = p.secondary_soft }
  t.NoiceLspProgressSpinner = { fg = p.accent }
  t.NoiceCompletionItemKindDefault = { fg = p.secondary_soft }
  t.NoiceCursor = { fg = p.hl_high, bg = p.text }

  -- trouble.nvim
  t.TroubleNormal = { fg = p.text, bg = fl }
  t.TroubleNormalNC = { fg = p.text, bg = fl }
  t.TroubleText = { fg = p.text }
  t.TroubleCount = { fg = p.accent, bg = p.hl_med }
  t.TroubleIndent = { fg = p.faint }
  t.TroublePos = { fg = p.subtle }
  t.TroubleSource = { fg = p.muted, italic = true }
  t.TroubleFoldIcon = { fg = p.muted }
  t.TroubleLocation = { fg = p.muted }
  t.TroubleFileName = { fg = p.secondary_soft }
  t.TroubleIconDirectory = { fg = p.secondary_soft }

  -- bufferline.nvim
  local bl_fill = p.nc
  local bl_off = p.tab_bg
  local bl_sel = p.tab_sel
  local states = {
    { suf = '', bg = bl_off, fg = p.muted, accent = p.subtle },
    { suf = 'Visible', bg = bl_off, fg = p.subtle, accent = p.subtle },
    { suf = 'Selected', bg = bl_sel, fg = p.text, accent = p.primary, bold = true },
  }
  local bl_diag = { Error = p.err, Warning = p.tertiary, Info = p.secondary, Hint = p.accent }
  for _, s in ipairs(states) do
    t['BufferLineBackground' .. s.suf] = { fg = p.muted, bg = s.bg }
    t['BufferLineBuffer' .. s.suf] = { fg = s.fg, bg = s.bg, bold = s.bold, italic = s.suf == 'Selected' }
    t['BufferLineNumbers' .. s.suf] = { fg = s.accent, bg = s.bg, bold = s.bold }
    t['BufferLineNumbersDiagnostic' .. s.suf] = { fg = s.accent, bg = s.bg }
    t['BufferLineCloseButton' .. s.suf] = { fg = s.suf == 'Selected' and p.err or p.muted, bg = s.bg }
    t['BufferLineModified' .. s.suf] = { fg = git_change, bg = s.bg }
    t['BufferLineDuplicate' .. s.suf] = { fg = p.faint, bg = s.bg, italic = true }
    t['BufferLinePick' .. s.suf] = { fg = p.err, bg = s.bg, bold = true }
    t['BufferLineSeparator' .. s.suf] = { fg = bl_fill, bg = s.bg }
    t['BufferLineIndicator' .. s.suf] = { fg = s.suf == 'Selected' and p.primary or s.bg, bg = s.bg }
    t['BufferLineTabSeparator' .. s.suf] = { fg = bl_fill, bg = s.bg }
    t['BufferLineDevIconDefault' .. s.suf] = { fg = p.secondary_soft, bg = s.bg }
    t['BufferLineDiagnostic' .. s.suf] = { fg = s.suf == '' and p.muted or s.fg, bg = s.bg }
    for name, c in pairs(bl_diag) do
      t['BufferLine' .. name .. s.suf] = { fg = c, bg = s.bg, bold = s.bold }
      t['BufferLine' .. name .. 'Diagnostic' .. s.suf] = { fg = c, bg = s.bg, bold = s.bold }
    end
  end
  t.BufferLineFill = { fg = p.muted, bg = bl_fill }
  t.BufferLineTab = { fg = p.muted, bg = bl_off }
  t.BufferLineTabSelected = { fg = p.on_primary, bg = p.primary, bold = true }
  t.BufferLineTabSeparatorSelected = { fg = bl_fill, bg = p.primary }
  t.BufferLineTabClose = { fg = p.err, bg = bl_fill }
  t.BufferLineCloseButton = { fg = p.muted, bg = bl_off }
  t.BufferLineTruncMarker = { fg = p.muted, bg = bl_fill }
  t.BufferLineOffsetSeparator = { fg = p.muted, bg = bl_fill }
  t.BufferLineGroupLabel = { fg = p.base, bg = p.accent, bold = true }
  t.BufferLineGroupSeparator = { fg = p.accent, bg = bl_fill }

  -- todo-comments.nvim
  local todo = { FIX = p.err, TODO = p.secondary, HACK = p.tertiary, WARN = p.tertiary, PERF = p.accent, NOTE = p.secondary_soft, TEST = p.tertiary_soft }
  for key, c in pairs(todo) do
    t['TodoFg' .. key] = { fg = c }
    t['TodoBg' .. key] = { fg = p.base, bg = c, bold = true }
    t['TodoSign' .. key] = { fg = c }
  end

  -- flash.nvim
  t.FlashBackdrop = { fg = p.faint }
  t.FlashMatch = { fg = p.text, bg = p.hl_med }
  t.FlashCurrent = { fg = p.text, bg = blend(p.tertiary, p.base, 0.3) }
  t.FlashLabel = { fg = p.on_err, bg = p.err, bold = true }
  t.FlashPrompt = { fg = p.text, bg = p.surface }
  t.FlashPromptIcon = { fg = p.tertiary }

  -- misc: lightbulb, cursorword, ts-context, toggleterm, alpha / dashboard
  t.LightBulbSign = { fg = p.tertiary }
  t.LightBulbVirtualText = { fg = p.tertiary }
  t.LightBulbSignLine = { link = 'CursorLine' }
  t.CursorWord = { bg = p.hl_med }
  t.CursorWord0 = { bg = p.hl_med }
  t.CursorWord1 = { bg = p.hl_med }
  t.TreesitterContext = { bg = p.hl_low }
  t.TreesitterContextLineNumber = { fg = p.muted, bg = p.hl_low }
  t.TreesitterContextBottom = { sp = p.muted, underline = true }
  t.TreesitterContextSeparator = { fg = p.faint }
  t.ToggleTerm = { fg = p.term.fg, bg = term_bg }
  t.ToggleTermBorder = { fg = p.muted, bg = term_bg }
  t.ToggleTermTitle = { fg = p.secondary_soft, bold = true }
  t.AlphaHeader = { fg = p.primary }
  t.AlphaButtons = { fg = p.secondary_soft }
  t.AlphaShortcut = { fg = p.tertiary }
  t.AlphaFooter = { fg = p.subtle, italic = true }
  t.DashboardHeader = { fg = p.primary }
  t.DashboardFooter = { fg = p.subtle, italic = true }
  t.DashboardShortCut = { fg = p.tertiary }
  t.DashboardCenter = { fg = p.secondary_soft }
  t.RainbowDelimiterRed = { fg = p.err }
  t.RainbowDelimiterYellow = { fg = p.tertiary }
  t.RainbowDelimiterBlue = { fg = p.secondary }
  t.RainbowDelimiterOrange = { fg = p.tertiary }
  t.RainbowDelimiterGreen = { fg = p.tertiary_soft }
  t.RainbowDelimiterViolet = { fg = p.accent }
  t.RainbowDelimiterCyan = { fg = p.secondary_soft }
  -- nvim-notify
  local notify = { ERROR = p.err, WARN = p.tertiary, INFO = p.secondary, DEBUG = p.muted, TRACE = p.accent }
  for lvl, c in pairs(notify) do
    t['Notify' .. lvl .. 'Border'] = { fg = c, bg = fl }
    t['Notify' .. lvl .. 'Icon'] = { fg = c }
    t['Notify' .. lvl .. 'Title'] = { fg = c, bold = true }
    t['Notify' .. lvl .. 'Body'] = { fg = p.text, bg = fl }
  end

  -- render-markdown
  for i = 1, 6 do
    t['RenderMarkdownH' .. i] = { fg = heading_hue[i], bold = true }
    t['RenderMarkdownH' .. i .. 'Bg'] = { bg = blend(heading_hue[i], p.base, 0.14) }
  end
  t.RenderMarkdownCode = { bg = p.hl_low }
  t.RenderMarkdownCodeInline = { fg = p.tertiary, bg = p.hl_low }
  t.RenderMarkdownBullet = { fg = p.primary }
  t.RenderMarkdownDash = { fg = p.muted }
  t.RenderMarkdownQuote = { fg = p.subtle }
  t.RenderMarkdownLink = { fg = p.accent, underline = true }
  t.RenderMarkdownChecked = { fg = p.tertiary_soft }
  t.RenderMarkdownUnchecked = { fg = p.subtle }
  t.RenderMarkdownTableHead = { fg = p.subtle }
  t.RenderMarkdownTableRow = { fg = p.subtle }
  t.RenderMarkdownTableFill = { link = 'Conceal' }

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

  local mode = resolve_mode()
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
  pcall(vim.api.nvim_exec_autocmds, 'ColorScheme', { modeline = false, pattern = 'matugen' })

  -- bufferline and toggleterm derive a few highlights from Normal themselves and
  -- land on grey / white under a light theme; repaint those onto the right tone.
  local function repaint_dynamic()
    pcall(function()
      for _, g in ipairs(vim.fn.getcompletion('BufferLineDevIcon', 'highlight')) do
        local cur = vim.api.nvim_get_hl(0, { name = g })
        if cur.fg then
          vim.api.nvim_set_hl(0, g, { fg = cur.fg, bg = g:find('Selected', 1, true) and p.tab_sel or p.tab_bg })
        end
      end
      for _, g in ipairs(vim.fn.getcompletion('ToggleTerm', 'highlight')) do
        if g:match('^ToggleTerm%d') then
          if g:match('WinBar') then
            vim.api.nvim_set_hl(0, g, { fg = p.subtle, bg = p.nc })
          elseif g:match('Border') then
            vim.api.nvim_set_hl(0, g, { fg = p.muted, bg = p.term.bg })
          elseif g:match('StatusLine') then
            vim.api.nvim_set_hl(0, g, { fg = p.subtle, bg = p.surface })
          else
            vim.api.nvim_set_hl(0, g, { fg = p.term.fg, bg = p.term.bg })
          end
        end
      end
    end)
  end
  -- Coalesce repaint requests. Window churn fires the autocmd below in bursts,
  -- and every repaint sweeps all BufferLineDevIcon* / ToggleTerm* groups; a
  -- token guard collapses a burst to one run now plus one after `delay`.
  local repaint_token = 0
  local function request_repaint(delay)
    repaint_token = repaint_token + 1
    local mine = repaint_token
    vim.schedule(function()
      if mine == repaint_token then
        repaint_dynamic()
      end
    end)
    vim.defer_fn(function()
      if mine == repaint_token then
        repaint_dynamic()
      end
    end, delay)
  end

  request_repaint(120)

  local grp = vim.api.nvim_create_augroup('matugen', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter', 'TabEnter', 'BufAdd', 'TermOpen' }, {
    group = grp,
    callback = function()
      request_repaint(60)
    end,
  })
  vim.api.nvim_create_autocmd('TermOpen', {
    group = grp,
    callback = function(ev)
      local win = vim.fn.bufwinid(ev.buf)
      vim.schedule(function()
        if not vim.api.nvim_win_is_valid(win) then
          return
        end
        pcall(vim.api.nvim_set_option_value, 'winhighlight', table.concat({
          'Normal:NormalTerminal', 'NormalNC:NormalTerminal', 'NormalFloat:NormalTerminal',
          'SignColumn:NormalTerminal', 'EndOfBuffer:NormalTerminal',
          'WinBar:NormalTerminal', 'WinBarNC:NormalTerminal', 'FloatBorder:TerminalBorder',
          'StatusLine:StatusLineTerm', 'StatusLineNC:StatusLineTermNC',
        }, ','), { win = win })
      end)
    end,
  })

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
