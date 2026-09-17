# Installation script for my dotfiles
import os
import platform
from pathlib import Path


class Install:
    def __init__(self):
        self.platform = platform.system()
        home = Path.home()
        self.bool_dict = {
            "configdir": (home / ".config").is_dir(),
            "localdir": (home / ".local").is_dir(),
            "localsharedir": (home / ".local/share").is_dir(),
            "applicationsdir": (home / ".local/share/applications").is_dir(),
            "fontsdir": (home / ".local/share/fonts").is_dir(),
            "localstatedir": (home / ".local/state").is_dir(),
            "zeddir": (home / ".config/zed").is_dir(),
        }

    def check_dirs(self):
        for key, value in self.bool_dict.items():
            print(key, value)

if __name__ == "__main__":
    obj = Install()
    obj.check_dirs()
