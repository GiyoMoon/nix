# Jasi's Nix configs
Nix configs for macOS.

**Extremely** inspired by [@malob](https://github.com/malob)'s [Nix configs](https://github.com/malob/nixpkgs).

## ⚡️ Installation
### ✨ Prerequisites
Install Nix
```sh
sh <(curl -L https://nixos.org/nix/install)
```

### 📁 Clone this config
> Note: You need to have the Xcode Command Line Tools installed. As these dotfiles also require a homebrew installation, you can just install homebrew which automatically installs the Command Line Tools if the aren't installed yet.
>
> --> https://brew.sh/
```
git clone https://github.com/GiyoMoon/nix ~/.config
```

### ▶️ First time build
You only need to execute this one time. Make sure to restart your shell after this, or maybe even restart your MacBook.
```
nix build .#darwinConfigurations.JasisMacBook.system
./result/sw/bin/darwin-rebuild switch --flake .#JasisMacBook
```

### 🔁 Update config
If you made any changes and want to update:
```
darwin-rebuild switch --flake .#JasisMacBook
```