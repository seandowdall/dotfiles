#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

if command -v brew >/dev/null 2>&1 && [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
  brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"

if command -v git >/dev/null 2>&1 && [[ ! -d "$TPM_DIR" ]]; then
  mkdir -p "$(dirname "$TPM_DIR")"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

link_path() {
  local source="$1"
  local target="$2"
  local target_dir

  target_dir="$(dirname "$target")"
  mkdir -p "$target_dir"

  if [[ -L "$target" ]]; then
    rm "$target"
  elif [[ -e "$target" ]]; then
    local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    printf 'Backed up %s to %s\n' "$target" "$backup"
  fi

  ln -s "$source" "$target"
  printf 'Linked %s -> %s\n' "$target" "$source"
}

link_path \
  "$DOTFILES_DIR/ghostty/config.ghostty" \
  "$HOME/.config/ghostty/config.ghostty"

link_path \
  "$DOTFILES_DIR/ghostty/config.ghostty" \
  "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

link_path \
  "$DOTFILES_DIR/aerospace/aerospace.toml" \
  "$HOME/.config/aerospace/aerospace.toml"

link_path \
  "$DOTFILES_DIR/tmux/tmux.conf" \
  "$HOME/.tmux.conf"

link_path \
  "$DOTFILES_DIR/config/nvim" \
  "$HOME/.config/nvim"
