
{ pkgs , inputs , ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim
  gcc
  # neovim
  alacritty
  kitty
  fish
  fzf
  lua
  git
  gnumake
  wl-clipboard
  chromium
  nautilus
  zathura
  zathuraPkgs.zathura_pdf_mupdf
  inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
