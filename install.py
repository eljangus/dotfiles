# Installation script for my dotfiles
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time


class Install:
    def __init__(self):
        self.platform = platform.system()
        self.home = Path.home()
        self.rootdir = Path(__file__).resolve().parent
        self.pkgs_ok = True
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
            (self.home / ".backup"),
        ]

    def check_dirs(self):
        # check if the necessary paths exists, if not create them
        match self.platform:
            case "Linux":
                for path in self.paths:
                    if path.is_dir() == False:
                        path.mkdir(parents=True, exist_ok=True)
            case "Darwin":
                if Path(self.home / ".config").is_dir() == False:
                    Path(self.home / ".config").mkdir(parents=True, exist_ok=True)
                if Path(self.home / ".backup").is_dir() == False:
                    Path(self.home / ".backup").mkdir(parents=True, exist_ok=True)

    # entries of a source dir, or nothing if it doesn't exist (git doesn't track empty dirs)
    def _scan(self, path):
        if not Path(path).is_dir():
            print(f"skipping missing dir: {path}")
            return []
        return [e for e in os.scandir(path) if e.name != ".DS_Store"]

    # read a dir and return a list containing the files and dirs in that dir
    def read_dotfiles(self):
        self.dots = []
        self.local_applications = []
        self.local_icons = []
        self.local_templates = []
        self.misc = []
        if self.platform == "Linux":
            for e in self._scan(Path(f"{self.rootdir}/files/Linux/local/applications")):
                if e.is_file() or e.is_dir():
                    self.local_applications.append(
                        (
                            Path(e.path),
                            Path(f"{self.home}/.local/share/applications/{e.name}"),
                            e.name,
                        )
                    )
            for e in self._scan(Path(f"{self.rootdir}/files/Linux/local/icons")):
                if e.is_file() or e.is_dir():
                    self.local_icons.append(
                        (
                            Path(e.path),
                            Path(f"{self.home}/.local/share/icons/{e.name}"),
                            e.name,
                        )
                    )
            for e in self._scan(
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
            for e in self._scan(Path(f"{self.rootdir}/files/Linux/misc/fonts")):
                if e.is_file() or e.is_dir():
                    self.misc.append(
                        (
                            Path(e.path),
                            Path(self.home / f".local/share/fonts/{e.name}"),
                            e.name,
                        )
                    )
            for e in self._scan(Path(f"{self.rootdir}/files/Linux/config")):
                if e.is_file() or e.is_dir():
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
            for e in self._scan(Path(f"{self.rootdir}/files/Darwin/config")):
                if e.is_file() or e.is_dir():
                    self.dots.append(
                        (Path(e.path), Path(f"{self.home}/.config/{e.name}"), e.name)
                    )
            return self.dots

    def install_arch_pkgs(self):
        if shutil.which("pacman") is None:
            print("pacman not found, skipping packages")
            return
        with open(f"{self.rootdir}/files/Linux/misc/pkgs.txt", "r") as f:
            self.pkglist = f.read().split()
            result = subprocess.run(
                ["sudo", "pacman", "-S", "--needed", *self.pkglist], check=False
            )
            self.pkgs_ok = result.returncode == 0

    def finish(self):
        if self.pkgs_ok:
            print("\nInstallation complete!\n")
        else:
            print(
                "\nInstallation finished, but pacman failed: packages were not installed.\n"
            )
        if self.platform == "Linux":
            print("Fonts changed: run `fc-cache -f`, if you haven't already done so.\n")
            with open(f"{self.rootdir}/files/Linux/misc/misc-pkgs.txt", "r") as f:
                print(
                    "Additionally you will need to grab these packages yourself as the AUR is not used\n"
                )
                print(f.read())

    # symlink my dotfiles
    def symlink_dots(self, list):
        for src, dest, name in list:
            if dest.is_symlink() and dest.resolve() == src.resolve():
                continue
            if dest.is_symlink() or dest.exists():
                shutil.move(dest, self.home / f".backup/{name}.{int(time.time())}")
            os.symlink(src, dest)

    def symlink_noctalia_settings(self):
        src = self.rootdir / "files/Linux/misc/settings.toml"
        dest = self.home / ".local/state/noctalia/settings.toml"
        if dest.is_symlink() and dest.resolve() == src.resolve():
            return
        if dest.is_symlink() or dest.exists():
            shutil.move(dest, self.home / f".backup/settings.toml.{int(time.time())}")
        os.symlink(src, dest)


# Run the functions if this file is executed as script
if __name__ == "__main__":
    obj = Install()
    obj.check_dirs()
    obj.read_dotfiles()
    obj.symlink_dots(obj.dots)
    if obj.platform == "Linux":
        obj.symlink_dots(obj.local_applications)
        obj.symlink_dots(obj.local_icons)
        obj.symlink_dots(obj.local_templates)
        obj.symlink_dots(obj.misc)
        obj.symlink_noctalia_settings()
        obj.install_arch_pkgs()
    obj.finish()
