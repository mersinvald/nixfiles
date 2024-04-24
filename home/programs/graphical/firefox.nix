{ config, pkgs, lib, ... }:

{
  home.file."Applications/Firefox.app/Contents/Resources/distribution/policies.json".text = ''
    {
      "policies": {
        "DisableTelemetry": true,
        "DisableFirefoxStudies": true,
        "EnableTrackingProtection": {
          "Value": true,
          "Locked": true,
          "Cryptomining": true,
          "Fingerprinting": true
        },
        "DisablePocket": true,
        "DisableFirefoxAccounts": true,
        "DisableAccounts": true,
        "DisplayBookmarksToolbar": "never",
        "ExtensionSettings": {
          "*": {
            "installation_mode": "blocked"
          },
          "uBlock0@raymondhill.net": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi",
            "installation_mode": "force_installed"
          },
          "jid1-MnnxcxisBPnSXQ@jetpack": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi",
            "installation_mode": "force_installed"
          },
          "{446900e4-71c2-419f-a6a7-df9c091e268b}": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/file/4263752/bitwarden_password_manager-2024.4.1.xpi",
            "installation_mode": "force_installed"
          },
          "treestyletab@piro.sakura.ne.jp": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi",
            "installation_mode": "force_installed"
          },
          "87677a2c52b84ad3a151a4a72f5bd3c4@jetpack": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/file/4262513/grammarly_1-8.912.0.xpi",
            "installation_mode": "force_installed"
          },
          "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/file/4245500/traduzir_paginas_web-10.0.1.1.xpi",
            "installation_mode": "force_installed"
          },
          "firefox@betterttv.net": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi",
            "installation_mode": "force_installed"
          },
          "{12cf650b-1822-40aa-bff0-996df6948878}": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/cookies-txt/latest.xpi",
            "installation_mode": "force_installed"
          },
          "jid0-3GUEt1r69sQNSrca5p8kx9Ezc3U@jetpack": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/terms-of-service-didnt-read/latest.xpi",
            "installation_mode": "force_installed"
          },
          "{6a65273e-2b26-40f5-b66e-8eed317307da}": {
            "install_url": "https://addons.mozilla.org/firefox/downloads/latest/new-tab-suspender/latest.xpi",
            "installation_mode": "force_installed"
          }
        }
      }
    }
  '';

  # Tree Style Tabs tweaks
  home.file."Library/Application Support/Firefox/Profiles/mersinvald/chrome/userChrome.css".text = ''
    @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

    #TabsToolbar {
        visibility: collapse;
    }

    #sidebar-header {
      display: none;
    }

    #sidebar-close {
      visibility: collapse;
    }

    #sidebar-header {
      display: none !important;
    }
  '';

  programs.firefox = {
    enable = true;
    package = null;

    profiles.mersinvald = {
      settings = {
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        # For userChrome.css
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
