{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/genmacaddr".source = ./genmacaddr;
}
