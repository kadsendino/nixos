
{ pkgs , dotfiles , ... }: {

	home.username = "maximilian";
	home.homeDirectory = "/home/maximilian";
	home.stateVersion = "25.11";
  home.packages = with pkgs; [
    freetube
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


	xdg.configFile."niri".source = dotfiles + "/niri";
	xdg.configFile."nvim".source = dotfiles + "/nvim";
	xdg.configFile."noctalia".source = dotfiles + "/noctalia";
}
