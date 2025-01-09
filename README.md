# dotfiles

## Manual installation

In shell, 
```bash

sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- -b ~/.local/bin init --apply syoh

```

## Devcontainer

In `devcontainer.json`, 
```json
{
  
  "onCreateCommand": "sh -c \"$(curl -fsLS get.chezmoi.io/lb)\" -- -b ~/.local/bin init --apply syoh"

}
```
