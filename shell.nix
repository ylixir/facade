{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation {
  name = "sicp-leasnins";
  buildInputs = import ./default.nix;
}
