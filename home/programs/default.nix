{ config, pkgs, lib, ... }:

{
  imports = [
    ./graphical/.
    ./terminal/.
    ./util/.
  ];
}
