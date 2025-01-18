# dotfiles

## Manual installation

In shell, 
```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b ~/.local/bin init --apply syoh
```
If zsh is not installed:
```bash
sudo apt-get update && sudo apt-get install -y zsh
```
Change default shell (password-less sudo and exouser):
```bash
sudo chsh -s /bin/zsh exouser
```

## Devcontainer

In `devcontainer.json` (top level),
```json
"onCreateCommand": "sh -c \"$(curl -fsLS get.chezmoi.io/lb)\" -- -b ~/.local/bin init --apply syoh"
```
