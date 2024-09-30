# rozukke dotfiles

My configuration for Fedora with Sway, meant to be used as a very simple setup with Stow.
Safe to say, I have learned a lot from using NixOS.

## Features
- `nvim` configuration based on NvChad but without the awful abstraction and hidden settings
- `.zshrc` with sane defaults
- simple `sway`, `kitty`, `waybar` and `rofi` configuraton with nice colors
- `kmonad` remap to colemak-dh and several symbol remaps (space as mod-tap) for a ThinkPad keyboard

## Setup
Install `stow` if you do not already have it, then:
```sh
cd ~
git clone https://github.com/rozukke/dotfiles.git
stow dotfiles
```
You may need to remove pre-existing configuration files.

> [!IMPORTANT]
> You probably want to make the cloned directory harder to delete, as the *dotfiles* directory will
contain the actual configuration that is then symlinked into your `XDG_CONFIG_HOME`. Deleting it will
break stuff.

To prevent accidental deletion from happening, run the following command:
```sh
# Require sudo to delete folder
sudo chattr +i ~/dotfiles
```
## Packages
Some packages that may be required for things to work:
- clipboard provider for nvim
- `kmonad` with a startup service (found in extras folder)
- `kitty` for Sway default terminal

## Todo
- Split into separate `stow` modules if that is worthwhile
