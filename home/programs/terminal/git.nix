{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "git@mkl.dev";
    userName = "Mike Lubinets";

    delta = {
      enable = true;
    };

    lfs = {
      enable = true;
    };

    extraConfig = {
        color.ui = true;
        color.status = {
          added = "green";
          changed = "yellow";
          untracked = "red";
        };
        core.editor = "nano";
        credential.helper = "osxkeychain";
        rerere.enabled = true;
        browser.gitscm.cmd = "/bin/sh -c 'open http://git-scm.com/docs/$(basename $1 .html)' --";
        help.browser = "gitscm";
        pull.ff = true;
        push.default = "simple";
        commit.verbose = true;
        diff.algorithm = "histogram";
        merge.conflictstyle = "zdiff3";
        url."git@github.com:".insteadOf = "https://github.com";
        url."git@gitlab.com:".insteadOf = "https://gitlab.com";
        url."git@git.mkl.dev:".insteadOf = "https://git.mkl.dev";
        url."git@git.dsrc.tii.ae:".insteadOf = "https://git.dsrc.tii.ae";
        github.user = "mersinvald";
        hub.protocol = "ssh";
    };

    aliases = {
      st = "status --short --branch";
      co = "checkout";
      aa = "add --all";
      au = "add --update";
      fa = "fetch --all";
      fap = "fetch --all --prune";
      b = "branch";
      ff = "merge --ff-only";
      ms = "merge --no-commit --log --no-ff";
      mc = "merge --log --no-ff";
      rc = "rebase --continue";
      ci = "commit -v";
      amend = "commit -v --amend";
      ignored = "!git ls-files -v | grep '^[[:lower:]]' | cut -c 3-";
      ignore = "update-index --assume-unchanged";
      acknowledge = "update-index --no-assume-unchanged";
      di = "diff";
      dc = "diff --cached";
      dh1 = "diff HEAD~1";
      h = "log --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s' -1";
      head = "log --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s' -1";
      hp = "show --patch --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s'";
      l = "log --graph --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s'";
      la = "log --graph --all --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s'";
      r = "log --graph --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s' -20";
      ra = "log --graph --all --pretty='tformat:%C(auto,yellow)%h%C(auto,reset) %C(auto,green)(%ar)%C(auto,reset) %C(auto,bold blue)<%an>%C(auto,reset) %C(auto,red)%d%C(auto,reset) %s' -20";
      lf = "log --first-parent --oneline";
      my-commits = "log --author='Mike Lubinets' --author-date-order --date=format:'%a %b %d %r' --format='%h | %ad | %s'";
      jump = "!$(brew --prefix git)/share/git-core/contrib/git-jump/git-jump";
    };

    ignores = [
      ##############################
      # OSX
      ##############################
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"

      # Thumbnails
      "._*"

      # Files that might appear on external disk
      ".Spotlight-V100"
      ".Trashes"

      ##############################
      # Sublime Text
      ##############################
      "*.sublime-*"

      ##############################
      # Vim
      ##############################
      ".*.sw[a-z]"
      "*.un~"
      "Session.vim"
      ".netrwhist"

      ##############################
      # Emacs
      ##############################
      "*~"
      "\#*\#"
      "/.emacs.desktop"
      "/.emacs.desktop.lock"
      ".elc"
      "auto-save-list"
      "tramp"
      ".\#*"

      # Org-mode
      ".org-id-locations"
      "*_archive"

      ##############################
      # ctags
      ##############################
      "tags"
      "TAGS"

      ".direnv"
      ".jj"
    ];
  };
}
