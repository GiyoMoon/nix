# 🌺 My Nix configs
Nix configs for macOS.

**Extremely** inspired by [@malob](https://github.com/malob)'s [Nix configs](https://github.com/malob/nixpkgs).

## ⚡️ Installation
### ✨ Prerequisites
➖ Install Nix
```sh
sh <(curl -L https://nixos.org/nix/install)
```

> It can happen that Nix fails to symlink the `/run` directory to `/private/var/run`. If so, execute this command:
```sh
echo 'run\tprivate/var/run' | sudo tee -a /etc/synthetic.conf
```
> A restart is required after this step

---
➖ Install brew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---
➖ Until [this issue](https://github.com/LnL7/nix-darwin/issues/149) is fixed, you need to move your global `nix.conf`
```sh
sudo mv /etc/nix/nix.conf /etc/nix/.nix-darwin.bkp.nix.conf
```

---
➖ Enable experimental nix features
```sh
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```
---
➖ Update your user's nix channels
```sh
nix-channel --update
```

### 📁 Clone this config
```
git clone https://github.com/GiyoMoon/nix ~/.nixconfig
```

### ▶️ First time build
You only need to execute these commands a single time. Make sure to restart your shell after this, or maybe even log out and in again for all configs to be applied.
```
cd ~/.nixconfig
```
```
nix build .#darwinConfigurations.JasisMacBook.system
```
```
./result/sw/bin/darwin-rebuild switch --flake .#JasisMacBook
```

### 🔁 Update config
If you made any changes and want to update:
```
darwin-rebuild switch --flake .#JasisMacBook
```

## 📋 Todo
Things I want to expand this Nix config with:
- [x] Install casks with homebrew
- [x] Git config
  - [x] Name, email, signingKey etc.
  - [x] Aliases
  - [x] Configure a work directory
  - [x] `git config --global pull.rebase true`
  - [x] [@malob](https://github.com/malob)'s nice [git log alias](https://github.com/malob/nixpkgs/blob/46a480cd1edf687df81c1d5f0f2b8de8f15a5154/home/git-aliases.nix#L47)
- [x] A nice shell setup with [fish](https://fishshell.com/) and [starship](https://starship.rs/)
- Small things which would be nice
  - [ ] Set default browser
  - [ ] Set login items
  - [ ] Set wallpaper
  - [ ] Disable startup sound
  - [ ] Clear dock apps
  - [ ] Remove spotlight shortcut
  - [ ] Add code to PATH
  - [ ] Show sound settings in menubar