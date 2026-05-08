
{ pkgs , inputs , ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
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
  wl-clipboard
  chromium
  firefox
  inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
