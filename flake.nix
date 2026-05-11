{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    spotify-visualizer.url = "github:kadsendino/spotify-visualizer";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable , home-manager, spotify-visualizer , ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
    };

    unstable = import nixpkgs-unstable {
      inherit system;
    };

    flakes = {
      inherit spotify-visualizer;
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
            inherit unstable flakes system;
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
        fontconfig

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
        exec fish
      '';

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        pkgs.libGL
        pkgs.glfw
        pkgs.llvmPackages_18.libclang
      ];
    };
  };
}
