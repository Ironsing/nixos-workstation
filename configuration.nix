{ config, pkgs, lib, ... }:

{
  # System
  system.stateVersion = "25.11";


  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda"; # Adjust this
  boot.kernelPackages = pkgs.linuxPackages_latest;


  # VM shared folder
  fileSystems."/mnt/nixos-share" = {
    device = "nixos-share";
    fsType = "virtiofs";
  };


  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  # Bluetooth
  hardware.bluetooth.enable = true;


  # Services
  services.resolved.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  services.blueman.enable = true;


  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;


  # Locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";


  # Security
  security.rtkit.enable = true;


  # User
  users.users.ironsing = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    shell = pkgs.zsh;
  };


  # Wayland / portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];


  programs.hyprland.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    python3
  ];
}