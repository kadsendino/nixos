{ pkgs , unstable , flakes , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #Media
    ungoogled-chromium
    freetube
    spotify
    flakes.spotify-visualizer.packages.${system}.default
    cava
    pipes

    protonvpn-gui

    #Messenger
    telegram-desktop
    signal-desktop

    #PDF/Latex
    gnumeric
    xournalpp
    texliveFull
  ];

}
