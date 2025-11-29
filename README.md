# dotfiles

## Manual installation

In shell, 
```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b ~/.local/bin init --apply syoh
```
If zsh and gh are not installed:
```bash
sudo apt-get update && sudo apt-get install -y zsh gh
```
Change default shell (password-less sudo and exouser):
```bash
sudo chsh -s /bin/zsh exouser
```

### Run all commands

```bash
sudo apt-get update && sudo apt-get install -y zsh gh
sudo chsh -s /bin/zsh exouser
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b ~/.local/bin init --apply syoh
```


## Devcontainer

### With `settings` (Recommended)

```json
"customizations": {
    "vscode": {
        "settings": {
            "dotfiles.repository": "dddlab/dotfiles",
            "dotfiles.targetPath": "~/dotfiles",
            "dotfiles.installCommand": "install.sh"
        }
    }
}
```

### With `onCreateCommand`

In `devcontainer.json` (top level),
```json
"onCreateCommand": "sh -c \"$(curl -fsLS get.chezmoi.io/lb)\" -- -b ~/.local/bin init --apply syoh"
```
