{lib, pkgs, ...}:
{
  home.file.".hammerspoon/init.lua".source = ./init.lua;
  home.file.".hammerspoon/Spoons" = {
    source = ./Spoons;
    recursive = true;
  };
}
