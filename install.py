# Installation script for my dotfiles
import os
import platform
import shutil
import time
from pathlib import Path


class Install:
    def __init__(self):
        self.platform = platform.system()
        self.home = Path.home()
        self.rootdir = Path(__file__).resolve().parent
        self.paths = [
            (self.home / ".config"),
            (self.home / ".local"),
            (self.home / ".local/share"),
            (self.home / ".local/share/applications"),
            (self.home / ".local/share/fonts"),
            (self.home / ".local/share/icons"),
            (self.home / ".local/state"),
            (self.home / ".local/state/noctalia"),
            (self.home / ".local/state/noctalia/community-templates"),
            (self.home / ".config/zed"),
            (self.home / ".backup"),
        ]

    def check_dirs(self):
        # check if the necessary paths exists, if not create them
        for path in self.paths:
            if path.is_dir() == False:
                path.mkdir(parents=True, exist_ok=True)

    # read a dir and return a list containing the files and dirs in that dir
    def read_dotfiles(self):
        self.dots = []
        self.local_applications = []
        self.local_icons = []
        self.local_templates = []
        self.misc = []
        if self.platform == "Linux":
            for e in os.scandir(Path(f"{self.rootdir}/files/Linux/local/applications")):
                if e.is_file() or e.is_dir():
                    self.local_applications.append(
                        (
                            Path(e.path),
                            Path(f"{self.home}/.local/share/applications/{e.name}"),
                            e.name,
                        )
                    )
            for e in os.scandir(Path(f"{self.rootdir}/files/Linux/local/icons")):
                if e.is_file() or e.is_dir():
                    self.local_icons.append(
                        (
                            Path(e.path),
                            Path(f"{self.home}/.local/share/icons/{e.name}"),
                            e.name,
                        )
                    )
            for e in os.scandir(
                Path(f"{self.rootdir}/files/Linux/local/community-templates")
            ):
                if e.is_file() or e.is_dir():
                    self.local_templates.append(
                        (
                            Path(e.path),
                            Path(
                                f"{self.home}/.local/state/noctalia/community-templates/{e.name}"
                            ),
                            e.name,
                        )
                    )
            for e in os.scandir(Path(f"{self.rootdir}/files/Linux/misc/fonts")):
                if e.is_file() or e.is_dir():
                    self.misc.append(
                        (
                            Path(e.path),
                            Path(self.home / f".local/share/fonts/{e.name}"),
                            e.name,
                        )
                    )
            for e in os.scandir(Path(f"{self.rootdir}/files/Linux/config")):
                if (e.is_file() or e.is_dir()) and e.name not in ["mimeapps.list"]:
                    self.dots.append(
                        (Path(e.path), Path(f"{self.home}/.config/{e.name}"), e.name)
                    )
            return (
                self.dots,
                self.local_applications,
                self.local_icons,
                self.local_templates,
                self.misc,
            )
        elif self.platform == "Darwin":
            raise Exception("Still WIP")

    def install_pkgs(self):
        pass

    # symlink my dotfiles
    def symlink_dots(self, list):
        for src, dest, name in list:
            if dest.is_symlink():
                if dest.resolve() == src.resolve():
                    continue
                else:
                    os.unlink(dest)
            elif dest.is_file() or dest.is_dir():
                shutil.move(dest, self.home / f".backup/{name}.{time.time()}")
            os.symlink(src, dest)


# Run the functions if this file is executed as script
# Note for later, don't forget fc-cache -f
if __name__ == "__main__":
    obj = Install()
    obj.check_dirs()
    obj.read_dotfiles()
    if obj.platform == "Linux":
        obj.symlink_dots(obj.dots)
        obj.symlink_dots(obj.local_applications)
        obj.symlink_dots(obj.local_icons)
        obj.symlink_dots(obj.local_templates)
        obj.symlink_dots(obj.misc)
        obj.install_pkgs()
    elif obj.platform == "Darwin":
        obj.symlink_dots(obj.dots)
