#!/usr/bin/env bash
# Runs after matugen writes ~/.config/nvim/lua/matugen.lua.
#
#  1. make sure something calls require('matugen').setup() at startup
#  2. signal any running Neovim to repaint (the module installs a SIGUSR1 handler)
#
# matugen.lua is a self-contained colorscheme - no plugins required. If your
# Neovim config doesn't source ~/.config/nvim/ (nvf, a flake, an isolated
# NVIM_APPNAME, ...) do step 1 yourself; see README.md.

set -euo pipefail

nvim_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
lua_dir="$nvim_dir/lua"
init_lua="$nvim_dir/init.lua"
lazy_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/lazy.nvim"
plugin_spec="$lua_dir/plugins/matugen.lua"

loader="require('matugen').setup()"

if grep -rqsF "require('matugen')" "$lua_dir" "$init_lua" 2>/dev/null; then
  : # already wired up
elif [ -d "$lazy_dir" ]; then
  mkdir -p "$(dirname "$plugin_spec")"
  cat > "$plugin_spec" <<EOF
return {
  dir = vim.fn.stdpath('config'),
  name = 'matugen',
  lazy = false,
  priority = 1000,
  config = function()
    $loader
  end,
}
EOF
elif [ -f "$init_lua" ]; then
  printf '\n%s\n' "$loader" >> "$init_lua"
else
  echo "matugen: add \"$loader\" to your Neovim config (see README.md)" >&2
fi

pkill -SIGUSR1 nvim >/dev/null 2>&1 || true
