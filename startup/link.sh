#!/usr/bin/env bash
set -euo pipefail

DOT="$HOME/dotfiles"
WIN_WEZTERM="/mnt/c/Users/$USER/.wezterm.lua" # replace $USER with your windows username if not same as linux username
# --- sanity checks ---
for f in tmuxconf nvimconf weztermconf; do
  if [[ ! -e "$DOT/$f" ]]; then
    echo "Error: expected '$DOT/$f' to exist."
    exit 1
  fi
done

# --- tmux: ~/.tmux.conf -> ~/dotfiles/tmuxconf ---
rm -f "$HOME/.tmux.conf"
ln -s "$DOT/tmuxconf" "$HOME/.tmux.conf"

# --- nvim: ~/.config/nvim/init.lua -> ~/dotfiles/nvimconf ---
mkdir -p "$HOME/.config/nvim"
rm -f "$HOME/.config/nvim/init.lua"
ln -s "$DOT/nvimconf" "$HOME/.config/nvim/init.lua"

# --- wezterm (Windows default) ---
# 1) Copy repo weztermconf -> Windows .wezterm.lua (ensures WezTerm can read it)
cp -f "$DOT/weztermconf" "$WIN_WEZTERM"

# 2) Make ~/dotfiles/weztermconf a symlink to the Windows file (shared)
#    (remove the existing file first; you will now edit the Windows file via this symlink)
rm -f "$DOT/weztermconf"
ln -s "$WIN_WEZTERM" "$DOT/weztermconf"

echo "Symlinks created:"
ls -l "$HOME/.tmux.conf"
ls -l "$HOME/.config/nvim/init.lua"
ls -l "$DOT/weztermconf"
echo "Windows wezterm path:"
ls -l "$WIN_WEZTERM" || true
