{ pkgs , unstable , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    freetube
    spotify
    telegram-desktop
    signal-desktop
    xournalpp
    texliveFull
  ];

}
