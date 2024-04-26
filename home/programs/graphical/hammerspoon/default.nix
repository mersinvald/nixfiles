{lib, pkgs, ...}:
let
  inherit (pkgs) stdenv;
  inherit (lib) mkIf;
in
{
  home.file.".hammerspoon" = mkIf stdenv.isDarwin {
    source = ./config;
    recursive = true;
  };
}
