
{ pkgs , dotfiles , lib , ... }: {
  imports = [
    ./packages/user_pckages.nix
  ];

	home.username = "maximilian";
	home.homeDirectory = "/home/maximilian";
	home.stateVersion = "25.11";

  xdg.desktopEntries.spotify = {
    name = "Spotify";
    exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    icon = "spotify-client";
    type = "Application";
    categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    mimeType = [ "x-scheme-handler/spotify" ];
  };


	programs.git = {
    enable = true;
	  settings = {
		user = {
      name  = "kadsendino";
      email = "mail@kadsendino.org";
		};
	  	init.defaultBranch = "main";
	  };
  };

  programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
  };

	home.activation.symlinkDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
  mkdir -p $HOME/Bilder
  mkdir -p $HOME/.config

  # ln -sfn /etc/nixos/ $HOME/nixos
  ln -sfn /etc/nixos/dotfiles/wallpaper/ $HOME/Bilder/wallpaper
  ln -sfn /etc/nixos/dotfiles/noctalia/ $HOME/.config/noctalia
  ln -sfn /etc/nixos/dotfiles/niri/ $HOME/.config/niri
  ln -sfn /etc/nixos/dotfiles/nvim/ $HOME/.config/nvim
  ln -sfn /etc/nixos/dotfiles/kitty/ $HOME/.config/kitty
  ln -sfn /etc/nixos/dotfiles/fish/ $HOME/.config/fish
  '';
}
