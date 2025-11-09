# Duy's dotfiles & Things to do with fresh macOS

- Download your macOS stand-alone installer (if you want Big Sur, then [here](https://github.com/corpnewt/gibMacOS))

- Boot into Recovery Mode
	- Disable SIP (System Integrity Protection): [Guide](https://www.macworld.co.uk/how-to/mac/how-turn-off-mac-os-x-system-integrity-protection-rootless-3638975/), `csrutil disable`
	- Disable Secureboot (Change `Security Policy` to `Reduced Security` in `Startup Disk` settings)
- Disable Gatekeeper: `sudo spctl --master-disable`
- Change DNS (to [1.1.1.1](https://1.1.1.1/dns/), or [Google](https://developers.google.com/speed/public-dns))
- Install [encrypted DNS profiles](https://github.com/paulmillr/encrypted-dns)
- Install the Xcode Command Line Tools: `xcode-select --install`
- Install Rosetta (For Apple Silicon only): `sudo softwareupdate --install-rosetta`
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Login to app store (prepare to install app)
- Install `Xcode`
- Agree to Xcode `sudo xcodebuild -license accept`
- Install pretty much everything else: `eval "$(/opt/homebrew/bin/brew shellenv)" && curl https://raw.githubusercontent.com/huynhducduy/dotfiles/master/Brewfile -s -o Brewfile && brew bundle install`
- Verify homebrew installation: `brew doctor`
- Import SSH Keys, GPG Keys
```sh
sudo mkdir ~/.ssh
sudo vi ~/.ssh/id_ed25519 # SSH private-key
sudo touch ~/.ssh/known_hosts
sudo chown -v $USER ~/.ssh
sudo chown -v $USER ~/.ssh/id_ed25519
sudo chown -v $USER ~/.ssh/known_hosts
gpg —-import /path/to/secret-key-backup
```
- Config git, jj:
```sh
sudo git lfs install --system
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
git config --global user.signingkey "yourgpgkey"
jj config set --user user.name "Your Name Here"
jj config set --user user.email "your_email@youremail.com"
jj config set --user signing.key "yourgpgkey"
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
- Initialize some packages:
```sh
broot
colima nerdctl install
sudo ln -s /usr/local/bin/nerdctl /usr/local/bin/docker # use nerdctl as a replacement of docker
```
- Set rustup profile
```sh
rustup set profile default
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
- Install MySQL from [here](https://dev.mysql.com/downloads/mysql/) (I prefer dmg installation because it come with preference menu), remember to `mysql_secure_installation`
- Config for MySQL:
```
echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.zshrc
. ~/.zshrc
mysql_secure_installation
```
- Set `Keka` as default, enable finder extension
- Set `CotEditor` as default plain text file openner
```sh
brew install duti
duti -s com.coteditor.CotEditor public.plain-text all
brew uninstall duti
```
- Import config for `Raycast`
- Config `Logi Options`/`G Hub`
- Config `Openkey`: modern icon, `ctrl + shift` to switch language
- Open all apps and verify, then check for startup apps.
- Perform some tweak to the macOS: `sh ./osx.sh`
- Check the following settings in `System Preferences`:
	- iCloud: Sync everything
	- Wifi: 
		- Private Wi-Fi address: `Rotate` or `Fixed`
		- Limit IP address tracking: on
		- Auto proxy discovery: on
	- General: Name
	- Appearance: Dark, Sidebar icon size: small
	- Apple Intelligence & Siri: Always show Siri captions, Always show speech
	- Control Center: 
		- Spotlight: don't show in menubar
		- Recent documents, applications and servers: None
		- Clock:
			- Show date: when space allows
			- Show the day of the week
			- Flash the time separators
	- Desktop & Dock:
		- Double-click a window's tile bar to: Minimize
		- Widgets: turn everything off
		- Ask to keep changes when closing documents
		- Drag windows to ..., Hold..., Tiled...: off
		- Mission Control: Automatically rearrange Spaces: off
			- Hot Corners: turn off
	- Display: turn off true tone, night shift
	- Spotlight: turn off everything
	- Sound: turn off startup sound
	- Lock Screen:
		- Start Screen Saver: never
		- Turn display off: 5 and 10 minutes
		- Require password: after 1 minute
	- Privacy & Security
		- FileVault: Off
	- Internet Accounts: add secondary accounts, work accounts,...
	- Keyboard: disable auto correction
		- Keyboard Shortcuts: remove Spotlight shortcuts
	- Trackpad: tap to click, app expose
- Finder Settings
- Messages: enable iCloud; Config on iPhone: Messages fowarding;
- Contexts: Disable panel, Cmd Tab start Fast Search on typing
- Chrome:
	- Enable legacy extensions (MV2)

```
chrome://flags/#temporary-unexpire-flags-m137                     [Enabled]
# Restart chrome, then
chrome://flags/#extension-manifest-v2-deprecation-warning         [Disabled]
chrome://flags/#extension-manifest-v2-deprecation-disabled        [Disabled]
chrome://flags/#extension-manifest-v2-deprecation-unsupported     [Disabled]
chrome://flags/#allow-legacy-mv2-extensions                       [Enabled]
```

- Install others awesome softwares: [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Awesome-software-to-install)
- Config `Kaleidoscope` integrations
