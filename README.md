# nixos
This is my Configuration for my nixos system

## Eduroam

For installing Eduroum use temporary shell with:
```
nix-shell -p \
  python3 \
  python3Packages.dbus-python \
  python3Packages.pygobject3 \
  networkmanager \
  glib \
  gobject-introspection
```
```
