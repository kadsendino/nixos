
{ pkgs , inputs , unstable , ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #Dev/System 
  python313
  lua
  git
  cargo
  rust-analyzer
  gcc
  gnumake
  cmake

  playerctl
  libinput

  #Browser
  firefox

  #Everything for PDF
  zathura
  zathuraPkgs.zathura_pdf_mupdf

  # File Exploerer
  nautilus
  yazi

  #Neovim/Vim
  vim
  unstable.neovim
  fd fzf
  markdownlint-cli2

  #Niri
  adwaita-icon-theme
  wl-clipboard
  xwayland-satellite
  kitty
  fish

  #Noctalia
  unstable.noctalia-shell
  ];
}
