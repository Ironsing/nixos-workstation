{ config, pkgs, ... }:

{
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
    pokemon-colorscripts   # terminal startup art
    tmux                   # terminal multiplexer

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

  imports = [
    ./lib/config-with-modules.nix
    ./lib/config-without-modules.nix
  ];
}