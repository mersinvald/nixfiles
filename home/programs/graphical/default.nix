{ config, pkgs, lib, ... }:

{
  imports = [
    ./wezterm/.
    ./zed/.
    ./firefox.nix
  ];
}
