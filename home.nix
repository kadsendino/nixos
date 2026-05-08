
{ pkgs , dotfiles , lib , ... }: {

	home.username = "maximilian";
	home.homeDirectory = "/home/maximilian";
	home.stateVersion = "25.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    freetube
    spotify
  ];


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
  ln -sfn /etc/nixos/ $HOME/nixos
  ln -sfn /etc/nixos/dotfiles/wallpaper/ $HOME/Bilder/wallpaper
  ln -sfn /etc/nixos/dotfiles/noctalia/ $HOME/.config/noctalia
  ln -sfn /etc/nixos/dotfiles/niri/ $HOME/.config/niri
  ln -sfn /etc/nixos/dotfiles/nvim/ $HOME/.config/nvim
  '';
}
