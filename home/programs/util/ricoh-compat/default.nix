{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.exiftool
  ];

  home.file.".local/bin/ricoh-compat".source = ./ricoh-compat;
  home.file.".local/bin/ricoh-uncompat".source = ./ricoh-uncompat;
}
