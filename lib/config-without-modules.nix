{ pkgs, ... }:

{
  xdg.configFile = {
    # Used almost exclusively for packages that don't have Nix modules

    # We can symlink entire directories, but there's a severe problem with that approach:
    # If any other home-manager module tries to place a file inside such a directory, it follows the symlink,
    # ends up in the Nix store, and fails to write because it's now outside $HOME.
    # In short, you can only symlink whole directories if no other module tries to write to them.

    # ─────────────────────────────────────────────
    # Colors
    # ─────────────────────────────────────────────
    "colors/colors.css".source = ../dotfiles/.config/colors/colors.css;
    "colors/colors.rasi".source = ../dotfiles/.config/colors/colors.rasi;

    # ─────────────────────────────────────────────
    # Fontconfig (file-level ONLY — critical)
    # ─────────────────────────────────────────────
    "fontconfig/fonts.conf".source = ../dotfiles/.config/fontconfig/fonts.conf;

    # ─────────────────────────────────────────────
    # Ghostty
    # ─────────────────────────────────────────────
    "ghostty/config".source = ../dotfiles/.config/ghostty/config;
    "ghostty/themes/catppuccin-mocha".source = ../dotfiles/.config/ghostty/themes/catppuccin-mocha;

    # ─────────────────────────────────────────────
    # Hyprlock
    # ─────────────────────────────────────────────
    "hypr/hyprland.conf".source = ../dotfiles/.config/hypr/hyprland.conf;
    "hypr/hyprlock.conf".source = ../dotfiles/.config/hypr/hyprlock.conf;

    # ─────────────────────────────────────────────
    # Hyprland
    # ─────────────────────────────────────────────
    "hypr/conf/animation.conf".source = ../dotfiles/.config/hypr/conf/animation.conf;
    "hypr/conf/appearance.conf".source = ../dotfiles/.config/hypr/conf/appearance.conf;
    "hypr/conf/autostart.conf".source = ../dotfiles/.config/hypr/conf/autostart.conf;
    "hypr/conf/environment.conf".source = ../dotfiles/.config/hypr/conf/environment.conf;
    "hypr/conf/input.conf".source = ../dotfiles/.config/hypr/conf/input.conf;
    "hypr/conf/keybinding.conf".source = ../dotfiles/.config/hypr/conf/keybinding.conf;
    "hypr/conf/layout.conf".source = ../dotfiles/.config/hypr/conf/layout.conf;
    "hypr/conf/misc.conf".source = ../dotfiles/.config/hypr/conf/misc.conf;
    "hypr/conf/programs.conf".source = ../dotfiles/.config/hypr/conf/programs.conf;
    "hypr/conf/windowrule.conf".source = ../dotfiles/.config/hypr/conf/windowrule.conf;
    "hypr/conf/workspaces.conf".source = ../dotfiles/.config/hypr/conf/workspaces.conf;

    # ─────────────────────────────────────────────
    # Oh My Posh
    # ─────────────────────────────────────────────
    "oh-my-posh/jandedobbeleer.omp.json".source =
      ../dotfiles/.config/oh-my-posh/jandedobbeleer.omp.json;

    # ─────────────────────────────────────────────
    # Rofi
    # ─────────────────────────────────────────────
    "rofi/config.rasi".source = ../dotfiles/.config/rofi/config.rasi;

    # ─────────────────────────────────────────────
    # SwayNC
    # ─────────────────────────────────────────────
    "swaync/config.json".source = ../dotfiles/.config/swaync/config.json;
    "swaync/style.css".source = ../dotfiles/.config/swaync/style.css;

    # ─────────────────────────────────────────────
    # Scripts
    # ─────────────────────────────────────────────
    "viegphunt/app_launcher.sh".source = ../dotfiles/.config/viegphunt/app_launcher.sh;
    "viegphunt/clipboard_launcher.sh".source = ../dotfiles/.config/viegphunt/clipboard_launcher.sh;
    "viegphunt/emoji_launcher.sh".source = ../dotfiles/.config/viegphunt/emoji_launcher.sh;
    "viegphunt/key_hints.sh".source = ../dotfiles/.config/viegphunt/key_hints.sh;
    "viegphunt/wallpaper_effects.sh".source = ../dotfiles/.config/viegphunt/wallpaper_effects.sh;
    "viegphunt/wallpaper_random.sh".source = ../dotfiles/.config/viegphunt/wallpaper_random.sh;
    "viegphunt/wallpaper_select.sh".source = ../dotfiles/.config/viegphunt/wallpaper_select.sh;

    # ─────────────────────────────────────────────
    # Waybar
    # ─────────────────────────────────────────────
    "waybar/config".source = ../dotfiles/.config/waybar/config;
    "waybar/style.css".source = ../dotfiles/.config/waybar/style.css;

    # ─────────────────────────────────────────────
    # Wlogout
    # ─────────────────────────────────────────────
    "wlogout/layout".source = ../dotfiles/.config/wlogout/layout;
    "wlogout/style.css".source = ../dotfiles/.config/wlogout/style.css;
    "wlogout/icons/lock.png".source = ../dotfiles/.config/wlogout/icons/lock.png;
    "wlogout/icons/logout.png".source = ../dotfiles/.config/wlogout/icons/logout.png;
    "wlogout/icons/reboot.png".source = ../dotfiles/.config/wlogout/icons/reboot.png;
    "wlogout/icons/shutdown.png".source = ../dotfiles/.config/wlogout/icons/shutdown.png;
    "wlogout/icons/suspend.png".source = ../dotfiles/.config/wlogout/icons/suspend.png;
  };
}
