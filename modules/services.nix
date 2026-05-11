{ config,  ... }:

{
  # List services that you want to enable:
  
  # networking
  networking.networkmanager.enable = true;
  
  networking.networkmanager.ensureProfiles.profiles = {
    eduroam = {
      connection = {
        id = "eduroam";
        type = "wifi";
        interface-name = "wlp3s0"; ## replace with your interface-name as displayed by "ip a" 
      };
      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };
      wifi-security = {
        key-mgmt = "wpa-eap"; ## adapt according to your universities setup
      };
      "802-1x" = { ## not all or even some additional values may be needed here according to your institution
        eap = "tls"; ## adapt according to your universities setup
        identity = "prietzem04@zedat.fu-berlin.de";
        client-cert = "/etc/ssl/certs/eduroam/cert.pem";
        private-key = "/etc/ssl/certs/eduroam/private.key";
        private-key-password = "p@ssw0rd-of-your-.key-file"; ## warning, this should only be done for testing purposes, as it makes the password world-readable. You should replace this with some form of secrets-management using sops-nix or agenix. 
        ca-cert = "/etc/ssl/certs/certs.pem";
      };
      ipv4 = {
        method = "auto";
      };
      ipv6 = {
        method = "auto";
      };
    };
  };

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
