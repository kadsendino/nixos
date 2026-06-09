{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    ruff
    pyright
    stdenv.cc.cc.lib   # provides libstdc++.so.6
    zlib
  ];
  shellHook = ''
    exec fish --init-command '
      echo "🐍 Python $(python --version)"
    '
  '';
}
