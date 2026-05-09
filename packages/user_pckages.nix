{ pkgs , unstable , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #Media
    freetube
    spotify

    #Messenger
    telegram-desktop
    signal-desktop

    #PDF/Latex
    xournalpp
    texliveFull
  ];

}
