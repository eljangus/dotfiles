# Neovim

A complete Neovim colorscheme generated from your noctalia colors.

`matugen-template.lua` renders to `~/.config/nvim/lua/matugen.lua` — a
self-contained colorscheme (no plugins required) covering the editor UI,
syntax, tree-sitter, LSP semantic tokens, diagnostics and the common plugin
ecosystem (bufferline, neo-tree, telescope, snacks, blink.cmp, gitsigns,
which-key, noice, trouble, indent-blankline, todo-comments, flash,
render-markdown, lualine, toggleterm, …). Both the light and dark palettes
are embedded, and a running Neovim repaints live on every wallpaper / mode
change.

This is the **Neovim NVF** catalog entry: a frozen snapshot from before
snacks.nvim (LazyVim's default explorer/picker) and neo-tree got their own
flush-background treatment, so both still use the elevated surface-container
tone. The sibling `../neovim-lazy` directory is a separate catalog entry with
that fix applied. Enable only one at a time in noctalia's template settings;
both write to the same output path.

## Pick a wallpaper scheme with some spread

A Material palette derived from a single image is often near-monochrome.
noctalia's default **`m3-content`** is the tightest of all — `primary` and
`secondary` frequently come out identical, so functions, keywords and types
end up the same color.

For a real syntax palette set, in noctalia's settings:

```
wallpaper_scheme = m3-tonal-spot     # or m3-vibrant / m3-expressive / m3-fruit-salad
```

## Wiring it up

The `apply.sh` hook tries to do this for you:

- **lazy.nvim** — writes `~/.config/nvim/lua/plugins/matugen.lua` that loads
  it as the startup colorscheme.
- **plain `init.lua`** — appends `require('matugen').setup()`.

If your config doesn't source `~/.config/nvim/` (nvf, a Nix flake, a custom
`NVIM_APPNAME`, LazyVim with a non-standard layout, …), add it yourself:

```lua
-- make require('matugen') resolvable, then:
require('matugen').setup()
```

For **nvf** (home-manager):

```nix
programs.nvf.settings.vim = {
  additionalRuntimePaths = [ "${config.home.homeDirectory}/.config/nvim" ];
  luaConfigRC.matugen = ''
    pcall(function() require('matugen').setup() end)
  '';
  # optional: follow the palette in lualine
  statusline.lualine.setupOpts.options.theme =
    lib.generators.mkLuaInline "require('matugen').get_lualine_theme()";
};
```

## Live reload

`apply.sh` runs `pkill -SIGUSR1 nvim`; `matugen.lua` installs a `SIGUSR1`
handler that re-requires itself and repaints. Requires Neovim 0.10+
(`vim.uv`) and `termguicolors`.

Note: an **already-open `:terminal`** keeps its 16 ANSI colors — Neovim only
reads `g:terminal_color_*` when a terminal is created. The window background
updates live; reopen the terminal to refresh the palette.

## Options

```lua
require('matugen').setup({ transparent = true })   -- editor / float bg -> NONE
```

`~/.config/nvim/lua/matugen.lua` also exposes:

- `require('matugen').get_lualine_theme()` — a lualine theme table
- `require('matugen').get_palette()` — the resolved palette

### Per-user overrides

Create `~/.config/nvim/lua/matugen_overrides.lua`:

```lua
return function(p)
  return {
    Comment = { fg = p.muted, italic = false },
    ['@keyword'] = { fg = p.accent, bold = true },
  }
end
```

It receives the palette and returns a `{ group = spec }` table merged in last.
