{ config, lib, pkgs, ... }:
with lib;

let
  cnfg = config.home.components.firefox;
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  options.home.components.firefox = {
    enable = mkEnableOption "firefox";

    enableDunstIntegration = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser in dunst.
      '';
    };

    enableXdgAssociations = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser in xdg.
      '';
    };

    setDefaultBrowserSessionVariable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, firefox gets set as default browser with DEFAULT_BROWSER.
      '';
    };
  };

  config = mkIf cnfg.enable {
    programs = {
      firefox = {
        enable = true;

        package = pkgs.wrapFirefox pkgs.firefox-unwrapped {

          /* ---- POLICIES ---- */
          # Check about:policies#documentation for options.
          extraPolicies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
              Value= true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            DisableFormHistory = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "always"; # alternatives: "never" or "newtab"
            DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
            SearchBar = "unified"; # alternative: "separate"

            /* ---- EXTENSIONS ---- */
            # Check about:support for extension/add-on ID strings.
            # Valid strings for installation_mode are "allowed", "blocked",
            # "force_installed" and "normal_installed".
            ExtensionSettings = {
              "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
              # Cookie AutoDelete:
              "CookieAutoDelete@kennydo.com" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/Cookie-AutoDelete/latest.xpi";
                installation_mode = "force_installed";
              };
              # Decentraleyes
              "jid1-BoFifL9Vbdl2zQ@jetpack" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/Decentraleyes/latest.xpi";
                installation_mode = "force_installed";
              };
              # Firefox Multi-Account Containers
              "@testpilot-containers" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
                installation_mode = "force_installed";
              };
              # NoScript
              "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/NoScript/latest.xpi";
                installation_mode = "force_installed";
              };
              # Proton Pass: Free Password Manager
              "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
                installation_mode = "force_installed";
              };
              # Startpage — Private Search Engine
              "{20fc2e06-e3e4-4b2b-812b-ab431220cada}" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/startpage-private-search/latest.xpi";
                installation_mode = "force_installed";
              };
              # uBlock Origin:
              "uBlock0@raymondhill.net" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                installation_mode = "force_installed";
              };
              # Privacy Badger:
              "jid1-MnnxcxisBPnSXQ@jetpack" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
                installation_mode = "force_installed";
              };
              ## Remove Preinstalled Extensions
              # Bing:
              "bing@search.mozilla.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/bing-search-engine-/latest.xpi";
                installation_mode = "blocked";
              };
              # Google:
              "google@search.mozilla.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/google-search-contextmenu/latest.xpi";
                installation_mode = "blocked";
              };
              # Wikipedia (en):
              "wikipedia@search.mozilla.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/quick-search-for-wikipedia/latest.xpi";
                installation_mode = "blocked";
              };
              # DuckDuckGo:
              "ddg@search.mozilla.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
                installation_mode = "blocked";
              };
            };

            /* ---- PREFERENCES ---- */
            # Check about:config for options.
            Preferences = {
              "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
              "extensions.pocket.enabled" = lock-false;
              "extensions.screenshots.disabled" = lock-true;
              "browser.topsites.contile.enabled" = lock-false;
              "browser.formfill.enable" = lock-false;
              "browser.search.suggest.enabled" = lock-false;
              "browser.search.suggest.enabled.private" = lock-false;
              "browser.urlbar.suggest.searches" = lock-false;
              "browser.urlbar.suggest.history" = lock-false;
              "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
              "browser.urlbar.shortcuts.history" = false;
              "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
              "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
              "browser.newtabpage.activity-stream.showSponsored" = lock-false;
              "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
            };
          };
        };

        /* ---- PROFILES ---- */
        # Switch profiles via about:profiles page.
        # For options that are available in Home-Manager see
        # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
        profiles ={
          profile_0 = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
            id = 0;               # 0 is the default profile; see also option "isDefault"
            name = "profile_0";   # name as listed in about:profiles
            isDefault = true;     # can be omitted; true if profile ID is 0
            settings = {          # specify profile-specific preferences here; check about:config for options
              "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
              "browser.startup.homepage" = "https://nixos.org";
              "browser.newtabpage.pinned" = [{
                title = "NixOS";
                url = "https://nixos.org";
              }];
              # add preferences for profile_0 here...
            };
          };
          #profile_1 = {
          #  id = 1;
          #  name = "profile_1";
          #  isDefault = false;
          #  settings = {
          #    "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
          #    "browser.startup.homepage" = "https://ecosia.org";
          #    # add preferences for profile_1 here...
          #  };
          #};
          # add profiles here...
        }; 
      };
    };

    # INFO: set firefox as default browser for electron apps
    home.sessionVariables.DEFAULT_BROWSER = mkIf cnfg.setDefaultBrowserSessionVariable
      "${pkgs.firefox}/bin/firefox";

    xdg.mimeApps.associations.added = mkIf cnfg.enableXdgAssociations {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}