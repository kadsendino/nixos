{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    cmake
  ];

  buildInputs = with pkgs; [
    # fontconfig (for yeslogic-fontconfig-sys)
    fontconfig

    # raylib deps (for raylib-sys)
    raylib
    libGL
    xorg.libX11
    xorg.libX11.dev
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
  ];
}
