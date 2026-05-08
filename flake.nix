{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		quickshell = {
			url = "github:outfoxxed/quickshell";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		noctalia = {
			url = "github:noctalia-dev/noctalia-shell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self , nixpkgs , home-manager , ... }: {
		nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.users.maximilian = import ./home.nix;
				}
			];
		};
	};


}
