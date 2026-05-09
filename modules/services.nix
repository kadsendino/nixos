{ config,  ... }:

{
  # List services that you want to enable:
  
  # networking
  networking.networkmanager.enable = true;
  
  # bluetooth
  hardware.bluetooth.enable = true;
  
  # battery information
  services.upower.enable = true;

  # usb drives
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
