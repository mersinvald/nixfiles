{
  enable = true;

  onActivation = {
    autoUpdate = true;
    upgrade = true;
    cleanup = "zap";
  };

  taps = [
    "homebrew/cask-fonts"
  ];

  brews = [
    "mas"
    "rclone"
    "htop"
    "minio-mc"
  ];

  caskArgs = {
    # Install apps in ~/Applications
    # Needed for Firefox Policies patching
    appdir = "~/Applications";
  };

  casks = [
    # System Utilities
    "karabiner-elements"
    "hammerspoon"
    "raycast"
    "wezterm"

    # Development
    "zed"
    "visual-studio-code"

    # Productivity
    "firefox"
    "obsidian"

    # Communications
    "telegram"

    # Photo & Video Editing
    "affinity-photo"
    "affinity-designer"
    "affinity-publisher"
    "gyroflow"
    "obs"

    # Fonts
    "font-fira-code"
    "font-jetbrains-mono"


# TODO: investigate those programs:
#      "soundsource"
#      "bartender"
#      "fantastical"
  ];

  masApps = {
    "Final Cut Pro" = 424389933;
    "Infuse" = 1136220934;
    "Bitwarden" = 1352778147;
    "Microsoft Word" = 462054704;
    "DaisyDisk (4.30)" = 411643860;
  };
}
