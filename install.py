# Installation script for my dotfiles
import os
import platform
from pathlib import Path


class Install:
    def __init__(self):
        self.platform = platform.system()
        self.home = Path.home()
        self.rootdir = self.home / "dotfiles"
        # self.zeddir = self.home / ".config/zed" # not using Zed currently
        self.paths = [
            (self.home / ".config"),
            (self.home / ".local"),
            (self.home / ".local/share"),
            (self.home / ".local/share/applications"),
            (self.home / ".local/share/fonts"),
            (self.home / ".local/share/icons"),
            (self.home / ".local/state"),
            (self.home / ".config/zed"),
        ]

    def check_dirs(self):
        # Special case: Zed, ~/.config/zed may never be a symlink due to the way zed works
        # if ~/.config/zed is a symlink then live theme reloading won't work for whatever fuckass reason
        # TS PMO 💢😭
        # though currently commented out as I do not use zed anymore (in favor of neovim)
        # if self.zeddir.is_symlink():
        #    os.unlink(self.zeddir)

        # check if the necessary paths exists, if not create them
        for path in self.paths:
            if path.is_dir() == False:
                path.mkdir(parents=True, exist_ok=True)

    # read a dir and return a list containing the files and dirs in that dir
    def read_dir(self):
        self.dots_list = []
        for e in os.scandir(Path(f"{self.rootdir}/.config")):
            if (e.is_file() or e.is_dir()) and e.name not in ("mimeapps.list", "zed"):
                self.dots_list.append(e.path)
        return self.dots_list

    # symlink my dotfiles
    def symlink_dots(self):
        self.read_dir()
        for entry in self.dots_list:
            print(entry)
            # os.symlink(e.path, f"{self.home}/.config")


# Run the functions if this file is executed as script
if __name__ == "__main__":
    obj = Install()
    obj.check_dirs()
    obj.symlink_dots()
