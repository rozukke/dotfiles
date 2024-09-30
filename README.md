# rozukke dotfiles

My configuration for Fedora with Sway, meant to be used as a very simple setup with Stow.
Safe to say, I have learned a lot from using NixOS.

## Of note:
- `nvim` configuration based on NvChad but without the awful abstraction and hidden settings
- `.zshrc` with sane defaults
- simple `sway`, `kitty`, `waybar` and `rofi` configuraton with nice colors
- `kmonad` remap to colemak-dh and several symbol remaps (space as mod-tap) for a ThinkPad keyboard

## Setup:
Install `stow` if you do not already have it, then:
```sh
cd ~
git clone https://github.com/rozukke/dotfiles.git && cd dotfiles
stow .
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

## Todo:
- Split into separate `stow` modules if that is worthwhile
