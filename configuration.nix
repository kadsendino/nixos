# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs , ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/locale.nix
      ./modules/services.nix
      ./modules/games.nix
      ./modules/fonts.nix
      ./packages/system_packages.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maximilian = {
    isNormalUser = true;
    description = "Maximilian";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable Wayland
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Niri
  programs.niri.enable = true;
  
  programs.nix-ld.enable = true;

  #Auto Update
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [ 
      "--print-build-logs"
      "--commit-lock-file" 
      ];
    dates = "daily";  # or "daily"
  };

  #Auto Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  systemd.services.nixos-upgrade.environment = {
    GIT_AUTHOR_NAME = "NixOS Auto-upgrade";
    GIT_AUTHOR_EMAIL = "root@&lt;nix&gt;";
    GIT_COMMITTER_NAME = "NixOS Auto-upgrade";
    GIT_COMMITTER_EMAIL = "root@&lt;nix&gt;";
  };

  # # Some programs need SUID wrappers, can be configured further or are
  # # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  networking.firewall.allowedTCPPorts = [ 57621 ];

  environment.variables = {
    PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11";

}
