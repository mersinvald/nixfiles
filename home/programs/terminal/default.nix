{ config, pkgs, lib, ... }:

{
  imports = [
    ./ssh/.
    ./git.nix
    ./zsh.nix
    ./fzf.nix
    ./zoxide.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    devenv
    cachix
    ripgrep
    bat
    eza
    fd
    screen
  ];
}
