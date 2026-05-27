{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
  ];
  RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  shellHook = ''
    exec fish
    echo "🦀 Rust $(rustc --version)"
  '';
}
