# .nix
My nix flake config to manage macOS.

## ⚡️ Installation
### ✨ Prerequisites
➖ Install Nix
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```
> Restart your shell after installing nix to make sure the nix command is available.
---
➖ Install brew (Will also install Command Line Tools for Xcode)
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Disable analytics
/opt/homebrew/bin/brew analytics off
```

### 📁 Clone this config
```
git clone https://github.com/GiyoMoon/nix ~/.nix
```

### 🔥 Activate config
➖ Enable nix-command and flakes and symlink to the home-manager config directory
```sh
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
ln -s ~/.nix ~/.config/home-manager
```
---
➖ Activate the config
```
cd ~/.nix
nix run home-manager -- switch
```
---
➖ 🚨 Fish needs to be set as the default shell manually
```sh
echo /Users/jasi/.nix-profile/bin/fish | sudo tee -a /etc/shells
chsh -s /Users/jasi/.nix-profile/bin/fish
```
> 🚨 You need to log out and log in again for all changes to take effect. A restart does NOT work properly.

### 🎉 Done
That's it! 🚀

Things you might want to do:
- Remove spotlight shortcut in `Settings > Keyboard > Shortcuts > Spotlight`
- Remove spotlight from the menu bar in `Settings > Control Centre > Menu Bar Only > Spotlight`

### 🔁 Update config
If you made any changes and want to update, you can run the home manager switch command directly to apply the changes:
```sh
nix flake update # optionally update flakes
home-manager switch
```
