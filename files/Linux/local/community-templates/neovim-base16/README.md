# Neovim (base16)

A base16 Neovim colorscheme generated from your noctalia colors.

`matugen-template.lua` renders to `~/.config/nvim/lua/matugen.lua` -- a
self-contained colorscheme (no plugins required) covering the editor UI,
syntax, tree-sitter, diagnostics and the common plugin ecosystem (bufferline,
neo-tree, telescope, snacks, blink.cmp, gitsigns, which-key, noice, trouble,
todo-comments, lualine, …). Both the light and dark palettes are embedded,
and a running Neovim repaints live on every wallpaper / mode change.

This is the only actively-used catalog entry for Neovim now -- the earlier
Material You version (`neovim-lazy`) is retired in `../../.archive/neovim-lazy`,
kept only for reference. This template uses 16 flat colours, no Material
tonal-ramp math, and every slot is one of noctalia's terminal colours
unchanged: base08-0E are the bright ANSI colours, and base09 / base0F
(orange / brown, which ANSI doesn't have) are the normal red / yellow.

## Wiring it up

After matugen writes the colorscheme file, `apply.sh` wires it up (and, on
lazy.nvim, bufferline too):

- **lazy.nvim** -- writes `~/.config/nvim/lua/plugins/matugen.lua` that loads
  it as the startup colorscheme.
- **bufferline.nvim, lazy.nvim only** -- also writes
  `~/.config/nvim/lua/plugins/matugen-bufferline.lua`, which extends your
  *existing* bufferline spec (via `optional = true`, so it's a no-op if you
  don't have one) with a `highlights` function. bufferline re-derives its
  own highlights on every colorscheme change and feeds each tab's per-
  filetype icon background from that -- if we only set our colours from
  *inside* the colorscheme file, bufferline's own re-derive always wins one
  step later, which is why the icon backgrounds used to drift out of sync
  with the tab. Handing bufferline a `highlights` *function* instead means
  it calls back into `require('matugen').get_palette()` every time it
  re-derives, so the icon background can never go stale.
- **plain `init.lua`** -- appends `require('matugen').setup()`. There's no
  equivalent bufferline auto-wiring for this path; if you hit the icon-drift
  issue here, add the `highlights` function from
  `plugins/matugen-bufferline.lua` to your own bufferline options.

If your Neovim config doesn't source `~/.config/nvim/` (nvf, a Nix flake, a
custom `NVIM_APPNAME`, LazyVim with a non-standard layout, …), wire up the
colorscheme yourself:

```lua
-- make require('matugen') resolvable, then:
require('matugen').setup()
```

## Live reload

`apply.sh` runs `pkill -USR1 -x nvim`; `matugen.lua` installs a `SIGUSR1`
handler that re-requires itself and repaints. Requires Neovim 0.10+
(`vim.uv`) and `termguicolors`.

Changing `background` inside Neovim (LazyVim's `<leader>ub`, or a plugin)
repaints from the embedded palette for that mode instead of falling back to
Neovim's defaults; the next noctalia change goes back to following its mode.

## Options

```lua
require('matugen').setup({ transparent = true })   -- editor / float bg -> NONE
```

Floats are flush with the editor; snacks windows (explorer, picker, lazygit),
the `:Lazy` window and which-key sit one rung up on the unfocused-tab colour
(`NONE` when transparent).

`~/.config/nvim/lua/matugen.lua` also exposes:

- `require('matugen').get_lualine_theme()` -- a lualine theme table
- `require('matugen').get_palette()` -- the resolved palette (`bg`, `fg`,
  `red`/`orange`/`yellow`/`green`/`cyan`/`blue`/`magenta`/`brown`, `nc` /
  `tab_bg` / `tab_sel`, …)

### Per-user overrides

Create `~/.config/nvim/lua/matugen_overrides.lua`:

```lua
return function(p)
  return {
    Comment = { fg = p.muted, italic = false },
    ['@keyword'] = { fg = p.magenta, bold = true },
  }
end
```

It receives the palette and returns a `{ group = spec }` table merged in
last.
