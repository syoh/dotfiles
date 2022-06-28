# dotfiles

```bash
sudo apt install curl wget git yadm
curl -s -o gh.deb \
  https://github.com/cli/cli/releases/download/v2.13.0/gh_2.13.0_linux_amd64.deb \
&& sudo dpkg -i gh_2.13.0_linux_amd64.deb \
&& sudo apt install -f

gh auth login -h github.com -s codespace,workflow -p https --web \
&& yadm clone https://github.com/syoh/dotfiles.git

# vscode
sudo apt-get install wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code

# docker
```
