# Duy's dotfiles & Things to do with fresh macOS

- Disable SIP - in Recovery Mode (System Integrity Protection): [Guide](https://www.macworld.co.uk/how-to/mac/how-turn-off-mac-os-x-system-integrity-protection-rootless-3638975/)
- Disable Gatekeeper: `sudo spctl --master-disable`
- Change DNS (to [1.1.1.1](https://1.1.1.1/dns/), or [Google](https://developers.google.com/speed/public-dns))
- Install the Xcode Command Line Tools: `xcode-select --install`
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- Install pretty much everything else: `curl https://raw.githubusercontent.com/huynhducduy/dotfiles/master/Brewfile -s -o Brewfile && brew bundle install`
- Config git:
```
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
git config --global user.signingkey "yourgpgkey"
git config --global commit.gpgsign true
```
- Import SSH Keys, GPG Keys
```
sudo mkdir ~/.ssh & sudo vi ~/.ssh/id_rsa
gpg —-import /path/to/public-key-backup
gpg —-import /path/to/secret-key-backup
```
- Add Anaconda to PATH: `export PATH="/usr/local/anaconda3/bin:$PATH"`
- Install Docker from [here](https://download.docker.com/mac/stable/Docker.dmg)
- Install MySQL from [here](https://dev.mysql.com/downloads/mysql/) (I prefer dmg installation because it come with preference menu)
- Config for MySQL:
```
echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.zshrc
. ~/.zshrc
mysql_secure_installation
```
- Config iTerm2 (Coming soon...)
- Config Google Chrome - Extensions - [Wiki](https://github.com/huynhducduy/dotfiles/wiki/Chrome-Extensions)
- Config VSCode + Intellij IDEA - Settings, extensions... [Wiki](https://github.com/huynhducduy/dotfiles/wiki/VSCode-Extensions)
