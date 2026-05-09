
{ pkgs , inputs , unstable , ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #Dev/System 
  lua
  git
  cargo
  gcc
  gnumake
  cmake

  #Browser
  chromium

  #Everything for PDF
  zathura
  zathuraPkgs.zathura_pdf_mupdf

  # File Exploerer
  nautilus

  #Neovim/Vim
  vim
  unstable.neovim
  fd fzf

  #Niri
  wl-clipboard
  xwayland-satellite
  kitty
  fish

  #Noctalia
  unstable.noctalia-shell
  ];
}
