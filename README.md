# Dotfiles

Personal macOS dotfiles.

## Install on a new Mac

```sh
git clone git@github.com:YOUR_GITHUB_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Replace `YOUR_GITHUB_USERNAME` after creating the GitHub repository.

Homebrew packages are tracked in `Brewfile`. The installer runs `brew bundle`
when Homebrew is available.

## Ghostty

Ghostty reads `config.ghostty` from several locations. This repo keeps one source file:

```text
~/dotfiles/ghostty/config.ghostty
```

The installer symlinks it to:

```text
~/.config/ghostty/config.ghostty
~/Library/Application Support/com.mitchellh.ghostty/config.ghostty
```

## AeroSpace

AeroSpace reads its config from `~/.config/aerospace/aerospace.toml`.
This repo keeps one source file:

```text
~/dotfiles/aerospace/aerospace.toml
```

The installer symlinks it to:

```text
~/.config/aerospace/aerospace.toml
```

## Neovim

Neovim is installed by Homebrew from `Brewfile`.

Neovim reads its config from `~/.config/nvim/init.lua`.
This repo keeps the full config directory:

```text
~/dotfiles/config/nvim
```

The installer symlinks it to:

```text
~/.config/nvim
```

## tmux

tmux is installed by Homebrew from `Brewfile`. The installer also clones TPM
when Git is available.

This repo keeps one source file:

```text
~/dotfiles/tmux/tmux.conf
```

The installer symlinks it to:

```text
~/.tmux.conf
```
