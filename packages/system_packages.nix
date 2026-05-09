
{ pkgs , inputs , unstable , ... }:

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
  cargo
  gnumake
  cmake
  wl-clipboard
  chromium
  nautilus
  zathura
  zathuraPkgs.zathura_pdf_mupdf
  unstable.neovim
  unstable.noctalia-shell
  ];
}
