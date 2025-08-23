# Duy's dotfiles & Things to do with fresh macOS

- Download your macOS stand-alone installer (if you want Big Sur, then [here](https://github.com/corpnewt/gibMacOS))

- Boot into Recovery Mode
	- Disable SIP (System Integrity Protection): [Guide](https://www.macworld.co.uk/how-to/mac/how-turn-off-mac-os-x-system-integrity-protection-rootless-3638975/), `csrutil disable`
	- Disable Secureboot (Change `Security Policy` to `Reduced Security`)
- Disable Gatekeeper: `sudo spctl --master-disable`
- Change DNS (to [1.1.1.1](https://1.1.1.1/dns/), or [Google](https://developers.google.com/speed/public-dns))
- Install the Xcode Command Line Tools: `xcode-select --install`
- Install Rosetta (For Apple Silicon only): `sudo softwareupdate --install-rosetta`
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Login to app store (prepare to install app)
- Install `Xcode`
- Agree to Xcode `sudo xcodebuild -license accept`
- Install pretty much everything else: `eval "$(/opt/homebrew/bin/brew shellenv)" && curl https://raw.githubusercontent.com/huynhducduy/dotfiles/master/Brewfile -s -o Brewfile && brew bundle install`
- Import SSH Keys, GPG Keys
```sh
sudo mkdir ~/.ssh && sudo vi ~/.ssh/id_rsa
sudo mkdir ~/.ssh && sudo vi ~/.ssh/id_ed25519
sudo touch ~/.ssh/known_hosts
sudo chown -v $USER ~/.ssh
sudo chown -v $USER ~/.ssh/id_rsa
sudo chown -v $USER ~/.ssh/id_ed25519
sudo chown -v $USER ~/.ssh/known_hosts
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
- Install oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
git clone https://github.com/Aloxaf/fzf-tab ~ZSH_CUSTOM/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
```
- Grab `.zshrc` from this repository and use it the way you like (like install `oh-my-zsh & some plugins`)
- Initial some packages:
```sh
broot
colima nerdctl install
sudo ln -s /usr/local/bin/nerdctl /usr/local/bin/docker # use nerdctl as a replacement of docker
```
- `Mise` as `Asdf`
```sh
ln -s ~/.local/share/mise ~/.asdf
```
- Install `Mise` tools
```sh
mise i
```
- Ln java
```sh
sudo mkdir /Library/Java/JavaVirtualMachines/zulu-<major version>.jdk
sudo ln -s ~/.local/share/mise/installs/java/zulu-<major version>/Contents /Library/Java/JavaVirtualMachines/zulu-<major version>.jdk/Contents
```
- Install nodejs essentials
```sh
corepack enable
corepack prepare pnpm@latest --activate
npm i -g typescript eslint @antfu/ni npq
# For nodejs < 16
npm i -g corepack
```
- Install rust
```sh
rustup default stable
rustup component add rustfmt
rustup component add clippy
```
- Install python essentials
```sh
uv tool install ruff@latest
uv tool install basedpyright@latest
uv tool install sqlfluff@latest
```
- Install MySQL from [here](https://dev.mysql.com/downloads/mysql/) (I prefer dmg installation because it come with preference menu), remember to `mysql_secure_installation`
- Config for MySQL:
```
echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.zshrc
. ~/.zshrc
mysql_secure_installation
```
- Install `battery` `curl -s https://raw.githubusercontent.com/actuallymentor/battery/main/setup.sh | bash`
- Run `battery` `battery maintain 80`
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
- Install [encrypted DNS profiles](https://github.com/paulmillr/encrypted-dns)
- Set `Keka` as default, give files permissions
- Import config for `Raycast`
- Install `Raycast` extensions [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Raycast-Extensions)
- Config `Google Chrome` - Extensions - [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Chrome-Extensions)
- Config `VSCode` + `Intellij IDEA` - Settings, extensions... [Wiki](https://github.com/huynhducduy/dotfiles/wiki/VSCode-Extensions)
- Config `Logi Options`
- Config `Openkey` - especially the `modern icon` which fit with macOS Big Sur
- Open all apps and verify, then check for startup apps.
- Perform some tweak to the macOS: `sh ./osx.sh`
- Check the following settings in `System Preferences`:
	- General: Dark Appearence, Small sidebar icons, no recent items
	- iCloud: better turn of sync for Photos
	- FileVault: Off
	- Hot Corners: Mission control, Desktop 
	- Keyboard: disable auto correction
	- Sharing: computer name
	- Dock + Menubar: auto hide dock, hide everything on menubar except battery
	- Sound: turn of startup sound
	- Trackpad: tap to click, app expose
	- Display: turn off true tone
	- Scroll direction (natural or stardard?)
	- Display resolution
	- Accessibility: Pointer Control: ignore built-in trackpad, slow down trackpad scroll speed, disable track pad when mouse keys => options 5 times (oply work for external keyboard)
	- Finder Pref: show all extensions,...
	- Messages: enable iCloud; Config on iPhone: Messages fowarding;
- Contexts: Disable panel, Cmd Tab start Fast Search on typing
- Install others awesome softwares: [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Awesome-software-to-install)
- Config `Kaleidoscope` integrations
