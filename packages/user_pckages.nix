{ pkgs , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    freetube
    spotify
  ];

}
