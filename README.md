# Jasi's Nix configs
Nix configs for macOS.

**Extremely** inspired by [@malob](https://github.com/malob)'s [Nix configs](https://github.com/malob/nixpkgs).

## ⚡️ Installation
### ✨ Prerequisites
Install Nix
```sh
sh <(curl -L https://nixos.org/nix/install)
```
---
It can happen that Nix fails to symlink the `/run` directory to `/private/var/run`. If so, execute this command:

Symlink /run to /var/run
```sh
echo 'run\tprivate/var/run' | sudo tee -a /etc/synthetic.conf
```
A restart is required after this step.

### 📁 Clone this config
> Note: You need to have the Xcode Command Line Tools installed. As these dotfiles also require a homebrew installation, you can just install homebrew which automatically installs the Command Line Tools if the aren't installed yet. --> https://brew.sh/
> 
> Another note: If you want to put your configs somewhere else than `~/.config`, you still need to create the [nix.conf](./nix/nix.conf) file under `~/.config/nix`.
```
git clone https://github.com/GiyoMoon/nix ~/.config
```

### ▶️ First time build
Until [this issue](https://github.com/LnL7/nix-darwin/issues/149) is fixed, you need to move your global `nix.conf`:
```sh
sudo mv /etc/nix/nix.conf /etc/nix/.nix-darwin.bkp.nix.conf
```
You only need to execute these commands one time. Make sure to restart your shell after this, or maybe even restart your MacBook for all configs to be applied.
```
cd ~/.config
```
```
nix build .#darwinConfigurations.JasisMacBook.system
```
```
sudo ./result/sw/bin/darwin-rebuild switch --flake .#JasisMacBook
```

### 🔁 Update config
If you made any changes and want to update:
```
darwin-rebuild switch --flake .#JasisMacBook
```