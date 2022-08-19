# Duy's dotfiles & Things to do with fresh macOS

- Download your macOS stand-alone installer (if you want Big Sur, then [here](https://github.com/corpnewt/gibMacOS))

- Disable SIP - in Recovery Mode (System Integrity Protection): [Guide](https://www.macworld.co.uk/how-to/mac/how-turn-off-mac-os-x-system-integrity-protection-rootless-3638975/), `csrutil disable`
- Disable Secureboot - in Recovery Mode
- Disable Gatekeeper: `sudo spctl --master-disable`
- Change DNS (to [1.1.1.1](https://1.1.1.1/dns/), or [Google](https://developers.google.com/speed/public-dns))
- Install the Xcode Command Line Tools: `xcode-select --install`
- Agree to Xcode `sudo xcodebuild -license accept`
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Login to app store (prepare to install app)
- Install pretty much everything else: `curl https://raw.githubusercontent.com/huynhducduy/dotfiles/master/Brewfile -s -o Brewfile && sudo brew bundle install`
- Import SSH Keys, GPG Keys
```sh
sudo mkdir ~/.ssh & sudo vi ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa
gpg —-import /path/to/public-key-backup
gpg —-import /path/to/secret-key-backup
```
- Config git:
```sh
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
git config --global user.signingkey "yourgpgkey"
git config --global commit.gpgsign true
git config --global help.autocorrect 1
```
- Install Java: `https://www.oracle.com/java/technologies/downloads/`
- Install oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
- Grab `.zshrc` from this repository and use it the way you like (like install `oh-my-zsh & some plugins`)
- Initial some packages:
```sh
broot
```
- Install nodejs version
```sh
fnm install 16
fnm install 18
fnm alias default 18
fnm alias 16 lts
npm i -g typescript eslint
corepack enable
# For nodejs < 16
npm i -g corepack
```
- Install Docker from [here](https://download.docker.com/mac/stable/Docker.dmg)
- Install MySQL from [here](https://dev.mysql.com/downloads/mysql/) (I prefer dmg installation because it come with preference menu), remember to `mysql_secure_installation`
- Config for MySQL:
```
echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.zshrc
. ~/.zshrc
mysql_secure_installation
```
- Manually config `broot` - `/usr/local/Cellar/broot/1.2.8/bin/broot`
- Config `iTerm2` - import profile `iterm2-huynhducduy.json`
- Config `Alacritty` - `~/.config/alacritty/alacritty.yml`
- Config `spotify-tui`, `spotifyd`
- Config `spicetify`
```sh
spicetify config custom_apps new-releases
spicetify config custom_apps lyrics-plus
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/install.sh | sh
```
- Install `https://github.com/huhridge/huh-spicetify-extensions`
	- Full App Display modified
	- Display full Album date
- Set `Keka` as default
- Import config for `Raycast`
- Config `Google Chrome` - Extensions - [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Chrome-Extensions)
- Config `VSCode` + `Intellij IDEA` - Settings, extensions... [Wiki](https://github.com/huynhducduy/dotfiles/wiki/VSCode-Extensions)
- For `Tabnine` (`Tabnine::config`, `Tabnine::sem`)
- Config `Logi Options`
- Config `Openkey` - especially the `modern icon` which fit with macOS Big Sur
- Config `Pock` - especially the `Now Playing Widget` which is very helpful
- Open all apps and verify, then check for startup apps.
- Perform some tweak to the macOS: `sh ./osx.sh`
- Check the following settings in `System Preferences`:
	- General: Dark Appearence, Small sidebar icons, no recent items
	- iCloud: better turn of sync for Photos
	- FileVault: Off
	- Hot Corners: Mission control, Desktop 
	- Accessibility: disable track pad when mouse keys => options 5 times (oply work for external keyboard)
	- Keyboard: disable auto correction
	- Sharing: computer name
	- Dock + Menubar: auto hide dock, hide everything on menubar
	- Sound: turn of startup sound
	- Trackpad: tap to click, app expose
	- Display: turn off true tone
	- Scroll direction (natural or stardard?)
	- Display resolution
	- Accessibility: Pointer Control: ignore built-in trackpad, slow down trackpad scroll speed
	- Finder Pref: show all extensions,...
- Install others awesome softwares: [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Awesome-software-to-install)
