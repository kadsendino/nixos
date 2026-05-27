{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    pkg-config
    fontconfig
  ];
  RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  shellHook = ''
    exec fish --init-command '
      echo "🦀 Rust $(rustc --version)"
    '
  '';
}
