{ config,  ... }:

{
  # List services that you want to enable:
  
  # networking
  networking.networkmanager.enable = true;

  # bluetooth
  hardware.bluetooth.enable = true;
  
  # battery information
  services.upower = {
    enable = true;
    percentageLow = 10;      # default is usually 10
    percentageCritical = 5;
    percentageAction = 3;
  };
  # usb drives
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
