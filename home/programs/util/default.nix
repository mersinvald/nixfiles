{ config, pkgs, lib, ... }:

{
  imports = [
    ./ricoh-compat/.
    ./genmacaddr/.
  ];
}
