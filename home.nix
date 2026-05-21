{ config, pkgs, ... }:

{
  imports = [
    ./modules/gtk-theme.nix
    ./modules/zsh.nix
    ./modules/tmux.nix
  ];


  programs.home-manager.enable = true;


  home.stateVersion = "25.11";
  home.username = "ironsing";
  home.homeDirectory = "/home/ironsing";


  home.packages = with pkgs; [
    # ─── Applications ───────────────────────────────────────────
    firefox
    discord
    spotify
    vscode

    # ─── Terminal / Shell Utilities ────────────────────────────
    bat                    # better cat
    eza                    # better ls
    fastfetch              # system info display
    fzf                    # fuzzy finder
    pokemon-colorscripts   # terminal startup art
    tmux                   # terminal multiplexer
    zoxide                 # smarter cd

    # ─── Hyprland / Wayland Core ───────────────────────────────
    ghostty                # terminal emulator
    hyprlock               # screen locker
    nemo                   # file manager

    # ─── Status Bar / Launchers / Notifications ───────────────
    rofi                   # app launcher
    rofimoji               # emoji picker for rofi
    swaynotificationcenter # notification daemon/UI
    waybar                 # top status bar
    wlogout                # logout/power menu

    # ─── Appearance / Theming ──────────────────────────────────
    oh-my-posh             # shell prompt theming
    adw-gtk3               # GTK theme
    bibata-cursors         # cursor theme
    whitesur-icon-theme    # icon pack
    qt6Packages.qt6ct      # Qt theme configuration tool
    libsForQt5.qtstyleplugin-kvantum # Qt theming engine

    # ─── Input / IME ───────────────────────────────────────────
    fcitx5                 # input method framework
    wtype                  # Wayland typing automation tool

    # ─── Clipboard ─────────────────────────────────────────────
    cliphist               # clipboard history
    wl-clipboard           # Wayland clipboard tools

    # ─── Screenshots / Recording Helpers ──────────────────────
    grim                   # screenshot utility
    slurp                  # screen region selector

    # ─── Wallpaper ─────────────────────────────────────────────
    swww                   # animated wallpaper daemon
    vips                   # fast image processing backend

    # ─── Audio / Media ─────────────────────────────────────────
    pamixer                # PulseAudio/PipeWire volume CLI
    pavucontrol            # graphical audio control panel
    playerctl              # media key control interface
    pulseaudio             # compatibility utilities

    # ─── Bluetooth and Networking ────────────────────────────────
    blueman                # Bluetooth GUI
    networkmanagerapplet   # tray applet for NetworkManager

    # ─── Brightness / Hardware ─────────────────────────────────
    brightnessctl          # brightness CLI tool

    # ─── Notifications / Desktop Integration ──────────────────
    libnotify              # notify-send support
    yad                    # lightweight GUI dialog utility

    # ─── Fonts ─────────────────────────────────────────────────
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
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