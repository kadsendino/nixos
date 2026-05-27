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

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    spotify-visualizer,
    ...
  }:
  let
    hostPlatform = "x86_64-linux";

    pkgs = import nixpkgs {
      system = hostPlatform;
    };

    unstable = import nixpkgs-unstable {
      system = hostPlatform;
    };

    flakes = {
      inherit spotify-visualizer;
    };

  in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      modules = [
        {
          nixpkgs.hostPlatform = hostPlatform;
        }

        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.users.maximilian = import ./home.nix;

          home-manager.extraSpecialArgs = {
            dotfiles = ./dotfiles;
            inherit unstable flakes hostPlatform;
          };
        }
      ];

      specialArgs = {
        inherit inputs unstable hostPlatform;
      };
    };


    # Dev shells — exposed globally
    devShells.${system} = {
      python = import ./environments/python.nix { inherit pkgs; };
      rust   = import ./environments/rust.nix   { inherit pkgs; };
    };
  #   devShells.${hostPlatform}.default = pkgs.mkShell {
  #     packages = with pkgs; [
  #       rustc
  #       cargo
  #       rust-analyzer
  #       cmake
  #       pkg-config
  #       fontconfig
  #       gfortran
  #       openblas
  #
  #       clang
  #       llvmPackages_18.libclang
  #
  #       mesa
  #       libGL
  #       glfw
  #
  #       wayland
  #       wayland-protocols
  #       libxkbcommon
  #
  #       xorg.libX11
  #       xorg.libXcursor
  #       xorg.libXi
  #       xorg.libXrandr
  #       xorg.libXinerama
  #
  #       python313
  #       python313Packages.scipy
  #       python313Packages.numpy
  #     ];
  #
  #     shellHook = ''
  #       export LIBCLANG_PATH="${pkgs.llvmPackages_18.libclang.lib}/lib"
  #       export PKG_CONFIG_PATH="${pkgs.openblas}/lib/pkgconfig:${pkgs.gfortran.cc}/lib/pkgconfig''${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
  #       exec fish
  #     '';
  #
  #     LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
  #       pkgs.libGL
  #       pkgs.glfw
  #       pkgs.llvmPackages_18.libclang
  #     ];
  #   };
  };
}
