{ emacsAttr
, epkgs ? []
, melpaPackages ? []
}:
let
  pkgs = import (import ./nix/sources.nix).nixpkgs {};
  emacs = (import ./emacs-versions.nix).${emacsAttr};
in
(pkgs.emacsPackagesFor emacs).emacsWithPackages (
  epkgs: [
    epkgs.seq
    epkgs.dash
    epkgs.transient
  ] ++ (with epkgs.melpaPackages; [
    libgit
    with-editor
  ])
)
