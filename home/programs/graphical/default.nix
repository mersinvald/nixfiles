{ config, pkgs, lib, ... }:

{
  imports = [
    ./wezterm/.
    ./zed/.
    ./obs/.
    ./hammerspoon/.
    ./firefox.nix
  ];
}
