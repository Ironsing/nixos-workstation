# ─── Meta ───────────────────────────────────────────────
[[ $- != *i* ]] && return

# ─── History (optional fallback if you didn’t fully move it to nix) ───
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory sharehistory

# ─── Keybinds ───────────────────────────────────────────
bindkey -e

# ─── FZF styling only (no init anymore) ────────────────
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

export FZF_TAB_COLORS='fg:#CDD6F4,bg:#1E1E2E,hl:#F38BA8,min-height=5'

# ─── Python venv helpers ───────────────────────────────
_activate_venv() {
  if [[ -f "$1/bin/activate" ]]; then
    source "$1/bin/activate"
  fi
}

mkvenv() {
  local name="''${1:-.venv}"
  [[ ! -d "$name" ]] && python3 -m venv "$name"
  _activate_venv "$name"
}

venv() { _activate_venv "''${1:-.venv}" }

# ─── Startup toys ──────────────────────────────────────
pokemon-colorscripts --no-title -s -r