{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;


  home.stateVersion = "25.11";
  home.username = "ironsing";
  home.homeDirectory = "/home/ironsing";


  home.packages = with pkgs; [
    zsh
    firefox
    discord
    spotify
    vscode
    blueman
    pavucontrol

    util-linux
    pulseaudio

    rofimoji

    # Hyprland basics
    ghostty
    nemo
    hyprlock

    # UI
    waybar
    swaynotificationcenter
    rofi
    wlogout

    # Appearance
    yad
    fcitx5
    adw-gtk3
    whitesur-icon-theme
    bibata-cursors
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum

    oh-my-posh


    # Wallpaper
    swww
    vips

    # Desktop integration
    libnotify
    networkmanagerapplet

    # Audio/media
    playerctl
    pamixer

    # Brightness
    brightnessctl

    # Screenshots
    grim
    slurp

    # Clipboard
    wl-clipboard
    cliphist

    # Fonts
    fontconfig
    nerd-fonts.jetbrains-mono
    wtype
    noto-fonts-color-emoji

    # Debugging
    fastfetch

    tmux

    eza
    fzf
    zoxide
    bat
    pokemon-colorscripts
  ];



  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
      share = true;
    };

    initContent = 
    ''
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
      pokemon-colorscripts --no-title --name charizard --form mega-x

      bindkey -e

      # aliases
      alias ls='eza --icons --color=always'
      alias ll='eza --icons --color=always -l'
      alias la='eza --icons --color=always -a'
      alias lla='eza --icons --color=always -la'
      alias lt='eza --icons --color=always -a --tree --level=1'
      alias grep='grep --color=always'
      alias vim='nvim'
      alias lzg='lazygit'
      alias lzd='lazydocker'

      # python venv helpers
      _activate_venv() {
        if [[ -f "$1/bin/activate" ]]; then
          source "$1/bin/activate"
        else
          echo "venv not found: $1"
        fi
      }

      mkvenv() {
        local name="''${1:-.venv}"
        [[ ! -d "$name" ]] && python3 -m venv "$name"
        _activate_venv "$name"
      }

      venv() { _activate_venv "''${1:-.venv}" }
    '';

    oh-my-zsh = {
      enable = false; # IMPORTANT: you're not using OMZ, you're using nix-native plugins
    };
  };

  programs.tmux = {
    enable = true;

    terminal = "tmux-256color";
    mouse = true;
    prefix = "C-z";
    escapeTime = 0;
    baseIndex = 1;
    keyMode = "emacs";

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];

    extraConfig = ''
        # Open new windows in current path
        bind N new-window -c "#{pane_current_path}"

        # Open new panes in current path
        bind H split-window -h -c "#{pane_current_path}"
        bind V split-window -v -c "#{pane_current_path}"

        # Rename current window & session
        bind W command-prompt -I "#W" { rename-window "%%" }
        bind S command-prompt -I "#S" { rename-session "%%" }

        # Close current window
        bind Q confirm-before -p "kill-window #W? (y/n)" kill-window

        set -g set-clipboard on
        set -g status-position top
        set -g renumber-windows on
        set -g terminal-overrides ",*:RGB"

        # Catppuccin
        set -g @catppuccin_flavor "mocha"

        # Window styling
        set -g window-status-separator "|"
        set -g status-left-length 0
        set -g status-left " #{?client_prefix,#[fg=#{@thm_red} bold],#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_yellow} bold],#[fg=#{@thm_green} bold]}}TMUX #[fg=#{@thm_fg} bold]| "

        set -g @catppuccin_window_number_position "left"
        set -g @catppuccin_window_current_number_color "#{@thm_mauve}"
        set -g @catppuccin_window_current_number "#[bold]#I: #W  "
        set -g @catppuccin_window_current_text ""

        set -g @catppuccin_window_current_left_separator " "
        set -g @catppuccin_window_current_middle_separator ""
        set -g @catppuccin_window_current_right_separator ""

        set -g @catppuccin_window_number_color "#{@thm_surface_0}"
        set -g @catppuccin_window_number "#[fg=#{@thm_fg} bold]#I: #W  "
        set -g @catppuccin_window_text ""

        set -g @catppuccin_window_status_style "custom"

        set -g @catppuccin_window_left_separator " "
        set -g @catppuccin_window_middle_separator ""
        set -g @catppuccin_window_right_separator ""

        set -g status-right "#[fg=#{@thm_peach} bold] [#S] #[fg=#{@thm_fg} bold]| "
        set -ga status-right "#[fg=#{@thm_blue} bold]󰃰 %a %d/%m/%Y ~ %H:%M "
      '';
  };

  programs.zsh.plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.zsh-autosuggestions;
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.zsh-syntax-highlighting;
    }
    {
      name = "zsh-completions";
      src = pkgs.zsh-completions;
    }
  ];

  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.oh-my-posh = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./dotfiles/.config/ohmyposh/viet.omp.json);
  };


  xdg.configFile = {
    # Hyprland
    "hypr/hyprland.conf".source =
      ./dotfiles/.config/hypr/hyprland.conf;

    "hypr/hyprlock.conf".source =
      ./dotfiles/.config/hypr/hyprlock.conf;

    "hypr/conf/animation.conf".source =
      ./dotfiles/.config/hypr/conf/animation.conf;

    "hypr/conf/appearance.conf".source =
      ./dotfiles/.config/hypr/conf/appearance.conf;

    "hypr/conf/autostart.conf".source =
      ./dotfiles/.config/hypr/conf/autostart.conf;

    "hypr/conf/environment.conf".source =
      ./dotfiles/.config/hypr/conf/environment.conf;

    "hypr/conf/input.conf".source =
      ./dotfiles/.config/hypr/conf/input.conf;

    "hypr/conf/keybinding.conf".source =
      ./dotfiles/.config/hypr/conf/keybinding.conf;

    "hypr/conf/layout.conf".source =
      ./dotfiles/.config/hypr/conf/layout.conf;

    "hypr/conf/misc.conf".source =
      ./dotfiles/.config/hypr/conf/misc.conf;

    "hypr/conf/programs.conf".source =
      ./dotfiles/.config/hypr/conf/programs.conf;

    "hypr/conf/windowrule.conf".source =
      ./dotfiles/.config/hypr/conf/windowrule.conf;

    "hypr/conf/workspaces.conf".source =
      ./dotfiles/.config/hypr/conf/workspaces.conf;


    # Fonts
    "fontconfig/fonts.conf".source =
      ./dotfiles/.config/fontconfig/fonts.conf;


    # Colors
    "colors/colors.css".source =
      ./dotfiles/.config/colors/colors.css;

    "colors/colors.rasi".source =
      ./dotfiles/.config/colors/colors.rasi;


    # Custom scripts
    "viegphunt".source = 
      ./dotfiles/.config/viegphunt;


    # Ghostty
    "ghostty/config".source =
      ./dotfiles/.config/ghostty/config;

    "ghostty/themes/catppuccin-mocha".source =
      ./dotfiles/.config/ghostty/themes/catppuccin-mocha;


    # Waybar
    "waybar/config".source =
      ./dotfiles/.config/waybar/config;

    "waybar/style.css".source =
      ./dotfiles/.config/waybar/style.css;


    # SwayNC
    "swaync/config.json".source =
      ./dotfiles/.config/swaync/config.json;

    "swaync/style.css".source =
      ./dotfiles/.config/swaync/style.css;


    # Rofi
    "rofi/config.rasi".source =
      ./dotfiles/.config/rofi/config.rasi;


    # Waylogout
    "wlogout/layout".source =
      ./dotfiles/.config/wlogout/layout;

    "wlogout/style.css".source =
      ./dotfiles/.config/wlogout/style.css;

    "wlogout/icons".source =
      ./dotfiles/.config/wlogout/icons;

    # Oh My Posh
    "oh-my-posh/viet.omp.json".source =
      ./dotfiles/.config/ohmyposh/viet.omp.json;
  };
}