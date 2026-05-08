
{ pkgs , dotfiles , ... }: {

	home.username = "maximilian";
	home.homeDirectory = "/home/maximilian";
	home.stateVersion = "25.11";

	programs.git = {
	  enable = true;
	  userName = "kadsendino";
	  userEmail = "mail@kadsendino.org";

	  extraConfig = {
	    init.defaultBranch = "main";
	  };

	};

	xdg.configFile."niri".source = dotfiles + "/niri";
}
