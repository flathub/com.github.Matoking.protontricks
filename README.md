Protontricks for Flatpak
========================

[Protontricks](https://github.com/Matoking/protontricks) packaged for Flatpak. Compatible with both native and Flatpak Steam installations.

# Installation

You can install Protontricks for Flatpak from the Flathub repository. You need to have Flatpak installed with the Flathub repository configured. For installing Flatpak and configuring Flathub, see the [official installation instructions](https://flatpak.org/setup/).

Install Protontricks for Flatpak using the following command:

```sh
flatpak install flathub com.github.Matoking.protontricks
```

Add an alias that allows you to call Protontricks using the `protontricks` alias:

```sh
echo "alias protontricks='flatpak run com.github.Matoking.protontricks'" >> ~/.bashrc
```

**You will need to source the updated file with`. ~/.bashrc` or restart any terminal emulators you have open for the alias to take effect.**

# Configuration

By default, Protontricks only has access to the Steam installation directory.
**You will need to add filesystem permissions for additional Steam library
locations, and other directories when running external EXEs.**

In order to grant access to other directories, you can use the
[Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal) graphical utility or
the [flatpak
override](https://docs.flatpak.org/en/latest/flatpak-command-reference.html?highlight=override#flatpak-override)
command (eg. `flatpak override --user --filesystem=<PATH> com.github.Matoking.protontricks`) to grant access to other directories.

For example, to grant access to `/mnt/MySSD/SteamLibrary`, you can run the following command:

```
flatpak override --user --filesystem=/mnt/MySSD/SteamLibrary com.github.Matoking.protontricks
```

# Usage

## Command-line

After you have installed Protontricks and added the alias, you can run Protontricks commands using the alias you configured:

```sh
# Find your game's App ID by searching for it
protontricks -s <GAME NAME>

# Run winetricks for the game
protontricks <APPID> <ACTIONS>
```

For the rest of the usage options, [see the README](https://github.com/Matoking/protontricks/blob/master/README.md) on the main Protontricks repository.

## Desktop

You can launch the Protontricks GUI using the **Protontricks** app shortcut,
and launch external EXEs using **Protontricks Launcher** when opening a Windows
executable in a file manager.

Due to the Flatpak security model, you might need to add filesystem permissions
as described in [Configuration](#Configuration). This is necessary when the Windows executable
requires access to other files.
