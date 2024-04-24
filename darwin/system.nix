{ config, pkgs, agenix, ... }: {
  environment.systemPackages =
    [
      pkgs.home-manager
      pkgs.jq
    ];

  # Use homebrew to install casks and Mac App Store apps
  homebrew = import ./homebrew.nix;

  services = {
    yabai = {
      enable = true;
      config = import ./yabai.nix;
        extraConfig = ''
          yabai -m rule --add app='Pop' manage=off sticky=on layer=above
          yabai -m rule --add app='System Settings' manage=off  sticky=on layer=above
        '';
    };
  };

  # Touch ID sudo unlock
  security.pam.enableSudoTouchIdAuth = true;

  # Adjust system defaults
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      mru-spaces = false;
      show-process-indicators = true;
      show-recents = false;
      static-only = true;
      tilesize = 32;
      persistent-apps = [
        "/Applications/Firefox.app"
        "/Applications/Zed.app"
      ];
    };

    ActivityMonitor = {
      ShowCategory = 101;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
      FXDefaultSearchScope = "SCcf";
      CreateDesktop = false;
    };

    NSGlobalDomain = {
      AppleKeyboardUIMode = 3;
      "com.apple.keyboard.fnState" = true;
      NSAutomaticWindowAnimationsEnabled = false;

      # Enables swiping left or right with two fingers to navigate backward or forward.
      AppleEnableMouseSwipeNavigateWithScrolls = true;
      AppleEnableSwipeNavigateWithScrolls = true;
    };

    loginwindow = {
      LoginwindowText = "RTFM";
      GuestEnabled = false;
    };

    screencapture.location = "~/Pictures/Screenshots";
  };
}
