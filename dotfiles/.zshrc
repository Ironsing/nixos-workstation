# ─── Meta ───────────────────────────────────────────────
[[ $- != *i* ]] && return

# ─── Keybinds ───────────────────────────────────────────
bindkey -e

# ─── Fuzzy finder styling; replicates catppuccin (allegedly) ────────────────
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_TAB_COLORS='fg:#CDD6F4,bg:#1E1E2E,hl:#F38BA8,min-height=5'

# ─── Zoxide ─────────────────────────────────
eval "$(zoxide init zsh)"

# ─── Startup toys ──────────────────────────────────────
pokemon-colorscripts -s --no-title --name charizard --form gmax

# aliases
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -l'
alias la='eza --icons --color=always -a'
alias lla='eza --icons --color=always -la'
alias lt='eza --icons --color=always -a --tree --level=1'
alias grep='grep --color=always'
alias lzg='lazygit'
alias lzd='lazydocker'