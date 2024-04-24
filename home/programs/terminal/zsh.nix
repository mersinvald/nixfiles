{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "exa --time-style long-iso --color=auto -F";
      ll = "l -ahlF";
      la = "l -a";
      ls = "l";
      grep = "rg";
      cat = "bat";
      less = "bat --pager=less";
      vi = "nvim";
      vim = "nvim";

      b = "cd - > /dev/null && l";
      ssh = "TERM=xterm-256color ssh";
    };

    initExtraFirst = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export NIX_PATH="$HOME/.nix-defexpr/channels"
      export PATH="$PATH:$HOME/.local/bin"
    '';

    initExtra = ''
      cd ()
      {
          # Pass all arguments to cd
          builtin cd "$@" || return $?
          # If everything OK, print ls and todo
          l
      }

      function diffs()
      {
          diff "$\{@:3\}" <(sort "$1") <(sort "$2")
      }
    '';

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:plugins/dotenv"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "zsh-users/zsh-syntax-highlighting"
        "hlissner/zsh-autopair"
        "zsh-users/zsh-autosuggestions"
        "zpm-zsh/clipboard"
        "peterhurford/git-it-on.zsh"
        # theme
        "denysdovhan/spaceship-zsh-theme"
      ];
    };
  };
}
