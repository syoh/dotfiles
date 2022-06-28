# dotfiles

```bash
sudo apt install curl wget git yadm
curl -fsSL \
    https://github.com/cli/cli/releases/download/v2.13.0/gh_2.13.0_linux_amd64.deb \
    -o gh.deb 
&& sudo dpkg -i gh.deb \
&& sudo apt install -f

gh auth login -h github.com -s codespace,workflow -p https --web \
&& yadm clone https://github.com/syoh/dotfiles.git

curl -fsSL https://get.docker.com -o get-docker.sh \
&& sudo sh get-docker.sh \
&& sudo groupadd docker \
&& sudo usermod -aG docker $USER \
&& newgrp docker 

sudo apt-get install -y zsh powerline fonts-powerline \
&& RUNZSH=no CHSH=no sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
&& test -f ~/.zshrc.pre-oh-my-zsh \
&& mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc \
&& chsh -s $(which zsh)

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
