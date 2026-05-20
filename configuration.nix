{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  # System
  system.stateVersion = "25.11";


  # Boot
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.kernelPackages = pkgs.linuxPackages_latest;


  # Filesystems, remove when using this config on my actual machine and not in a VM
  fileSystems."/mnt/nixos-share" = {
    device = "nixos-share";
    fsType = "virtiofs";
  };


  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  # Daemons
  services.resolved.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };


  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;


  # Locational config
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";


  # Security
  security.rtkit.enable = true;


  # Users
  users.users.ironsing = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };


  # XDG portals are required for many Wayland apps
  xdg.portal.enable = true;


  # Useful for screensharing/file pickers/etc
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];


  # Programs
  programs.hyprland.enable = true;
  programs.git.enable = true;
}
