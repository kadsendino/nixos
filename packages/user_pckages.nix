{ pkgs , unstable , flakes , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #Media
    freetube
    spotify
    flakes.spotify-visualizer.packages.${system}.default
    cava

    #Messenger
    telegram-desktop
    signal-desktop

    #PDF/Latex
    gnumeric
    xournalpp
    texliveFull
  ];

}
