
{ pkgs , dotfiles , ... }: {

	home.username = "maximilian";
	home.homeDirectory = "/home/maximilian";
	home.stateVersion = "25.11";

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


	xdg.configFile."niri".source = dotfiles + "/niri";
}
