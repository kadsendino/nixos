{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    #   url = "github:outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable , home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    unstable = import nixpkgs-unstable {
      inherit system;
    };
  in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.users.maximilian = import ./home.nix;

          home-manager.extraSpecialArgs = {
            dotfiles = ./dotfiles;
          };
        }
      ];

      specialArgs = { inherit inputs unstable; };
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        rustc
        cargo
        rust-analyzer
        cmake
        pkg-config

        clang
        llvmPackages_18.libclang

        mesa
        libGL
        glfw

        wayland
        wayland-protocols
        libxkbcommon

        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
        xorg.libXinerama
      ];

      shellHook = ''
        export LIBCLANG_PATH="${pkgs.llvmPackages_18.libclang.lib}/lib"
      '';

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        pkgs.libGL
        pkgs.glfw
        pkgs.llvmPackages_18.libclang
      ];
    };
  };
}
