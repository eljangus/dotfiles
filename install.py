# Installation script for my dotfiles
import os
import platform
import shutil
import subprocess
import time
from pathlib import Path


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
        self.common_paths = [
            (self.home / ".config/zed"),
        ]

    def check_dirs(self):
        # check if the necessary paths exists, if not create them
        match self.platform:
            case "Linux":
                for path in self.paths:
                    if path.is_symlink():
                        path.unlink()
                    if path.is_dir() == False:
                        path.mkdir(parents=True, exist_ok=True)
                for path in self.common_paths:
                    if path.is_symlink():
                        path.unlink()
                    if path.is_dir() == False:
                        path.mkdir(parents=True, exist_ok=True)
            case "Darwin":
                if Path(self.home / ".config").is_dir() == False:
                    Path(self.home / ".config").mkdir(parents=True, exist_ok=True)
                if Path(self.home / ".backup").is_dir() == False:
                    Path(self.home / ".backup").mkdir(parents=True, exist_ok=True)
                for path in self.common_paths:
                    if path.is_symlink():
                        path.unlink()
                    if path.is_dir() == False:
                        path.mkdir(parents=True, exist_ok=True)

    # entries of a source dir, or nothing if it doesn't exist (git doesn't track empty dirs)
    def _scan(self, path):
        if not Path(path).is_dir():
            print(f"\nskipping missing dir: {path}\n")
            return []
        return [e for e in os.scandir(path) if e.name not in [".DS_Store", "zed"]]

    # method to generate lists that contain the desired path tuples
    def _collect(self, src_path: str, dest_path: str):
        return [
            (Path(e.path), Path(f"{self.home}/{dest_path}/{e.name}"), e.name)
            for e in self._scan(
                Path(f"{self.rootdir}/files/{self.platform}/{src_path}")
            )
            if e.is_file() or e.is_dir()
        ]

    # read a dir and manipulate a list that will symlink the files
    def read_dotfiles(self):
        self.dots = self._collect("config", ".config")
        self.zed_dir = self._collect("config/zed", ".config/zed")
        if self.platform == "Linux":
            self.local_applications = self._collect(
                "local/applications",
                ".local/share/applications",
            )
            self.local_icons = self._collect(
                "local/icons",
                ".local/share/icons",
            )
            self.local_templates = self._collect(
                "local/community-templates", ".local/state/noctalia/community-templates"
            )
            self.misc = self._collect("misc/fonts", ".local/share/fonts")

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

    def install_brewfile(self):
        if shutil.which("brew") is None:
            print("brew not found, skipping packages")
            return
        brewfile = self.rootdir / "files/Darwin/misc/Brewfile"
        result = subprocess.run(
            ["brew", "bundle", "--file", str(brewfile)], check=False
        )
        self.pkgs_ok = result.returncode == 0

    def finish(self):
        if self.pkgs_ok:
            print("\nInstallation complete!\n")
        else:
            pkg_manager = "pacman" if self.platform == "Linux" else "brew"
            print(
                f"\nInstallation finished, but {pkg_manager} failed: packages were not installed.\n"
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
    obj.symlink_dots(obj.zed_dir)
    if obj.platform == "Linux":
        obj.symlink_dots(obj.local_applications)
        obj.symlink_dots(obj.local_icons)
        obj.symlink_dots(obj.local_templates)
        obj.symlink_dots(obj.misc)
        obj.symlink_noctalia_settings()
        obj.install_arch_pkgs()
    elif obj.platform == "Darwin":
        obj.install_brewfile()
    obj.finish()
