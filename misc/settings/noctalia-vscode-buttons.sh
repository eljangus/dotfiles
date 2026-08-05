#! /bin/sh

mkdir ~/.local/state/noctalia
sleep 0.5
cp ~/dotfiles/misc/settings/settings.toml ~/.local/state/noctalia/settings.toml
sleep 0.2
dconf write /org/gnome/desktop/wm/preferences/button-layout "''"
