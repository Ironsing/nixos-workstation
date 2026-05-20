{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "ironsing";
  home.homeDirectory = "/home/ironsing";

  # User packages
  home.packages = with pkgs; [
    firefox
    vscode
    spotify
    discord

    # Rice dependencies
    waybar
    rofi
    swaynotificationcenter
    wlogout
    tmux
    zsh
    cava
    oh-my-posh
    
    # Useful utilities commonly expected by Hyprland setups
    wl-clipboard
    grim
    slurp
    playerctl
    pavucontrol
    networkmanagerapplet
    brightnessctl
    pamixer
    fastfetch
  ];

  programs.home-manager.enable = true;

  # Shell
  programs.zsh.enable = true;

  # Hyprland ecosystem config deployment
  xdg.configFile = {

    # Colors
    "colors/colors.css".source =
      ./dotfiles/.config/colors/colors.css;

    "colors/colors.rasi".source =
      ./dotfiles/.config/colors/colors.rasi;

    # Fontconfig
    "fontconfig/fonts.conf".source =
      ./dotfiles/.config/fontconfig/fonts.conf;

    # Ghostty
    "ghostty/config".source =
      ./dotfiles/.config/ghostty/config;

    "ghostty/themes/catppuccin-mocha".source =
      ./dotfiles/.config/ghostty/themes/catppuccin-mocha;

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

    "hypr/conf/monitors.conf".source =
      ./dotfiles/.config/hypr/conf/monitors.conf;

    "hypr/conf/programs.conf".source =
      ./dotfiles/.config/hypr/conf/programs.conf;

    "hypr/conf/windowrule.conf".source =
      ./dotfiles/.config/hypr/conf/windowrule.conf;

    "hypr/conf/workspaces.conf".source =
      ./dotfiles/.config/hypr/conf/workspaces.conf;

    # Oh My Posh
    "ohmyposh/viet.omp.json".source =
      ./dotfiles/.config/ohmyposh/viet.omp.json;

    # Rofi
    "rofi/config.rasi".source =
      ./dotfiles/.config/rofi/config.rasi;

    # SwayNC
    "swaync/config.json".source =
      ./dotfiles/.config/swaync/config.json;

    "swaync/style.css".source =
      ./dotfiles/.config/swaync/style.css;

    # Waybar
    "waybar/config".source =
      ./dotfiles/.config/waybar/config;

    "waybar/style.css".source =
      ./dotfiles/.config/waybar/style.css;

    # Wlogout
    "wlogout/layout".source =
      ./dotfiles/.config/wlogout/layout;

    "wlogout/style.css".source =
      ./dotfiles/.config/wlogout/style.css;

    "wlogout/icons/lock.png".source =
      ./dotfiles/.config/wlogout/icons/lock.png;

    "wlogout/icons/logout.png".source =
      ./dotfiles/.config/wlogout/icons/logout.png;

    "wlogout/icons/reboot.png".source =
      ./dotfiles/.config/wlogout/icons/reboot.png;

    "wlogout/icons/shutdown.png".source =
      ./dotfiles/.config/wlogout/icons/shutdown.png;

    "wlogout/icons/suspend.png".source =
      ./dotfiles/.config/wlogout/icons/suspend.png;
  };

  # Top-level dotfiles
  home.file.".tmux.conf".source =
    ./dotfiles/.tmux.conf;

  home.file.".zshrc".source =
    ./dotfiles/.zshrc;
}