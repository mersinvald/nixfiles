{ config, pkgs, lib, ... }:

{
  imports = [
    ./wezterm/.
    ./zed/.
    ./obs/.
    ./firefox.nix
  ];
}
