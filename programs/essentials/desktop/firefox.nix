{
  ...
}:{
  home-manager.users.paci.programs.firefox = {
    enable = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      Cookies.Behavior = "reject-tracker-and-partition-foreign";
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisablePasswordReveal = true;
      DisableMasterPasswordCreation = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      DisplayMenuBar = "default-off";
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      GenerativeAI.Enabled = false;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      RequestedLocales = "en-US";
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          default_area = "navbar";
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          default_area = "navbar";
          private_browsing = true;
        };
        "search@kagi.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/kagi-search-for-firefox/latest.xpi";
          private_browsing = true;
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };

      FirefoxHome = {
        Highlights = false;
        Pocket = false;
        Search = false;
        Snippets = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        SponsoredTopSites = false;
        Stories = false;
        TopSites = true;
      };

      FirefoxSuggest = {
        ImproveSuggest = false;
        SponsoredSuggestions = false;
        WebSuggestions = false;
      };

      Preferences = {
        "general.smoothScroll" = true;
        "browser.search.region" = "GB";
        "trailhead.firstrun.didSeeAboutWelcome" = true;
        # make firefox not mess with pipewire
        "media.getusermedia.agc" = 0;
        "media.getusermedia.agc2_forced" = false;
        "media.getusermedia.agc_enabled" = false;
        # use KDE file picker
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        # Reopen Tabs
        "browser.startup.page" = 3;
      };

      SearchEngines.Add = [
        {
          Name = "Docker Hub";
          Alias = "@dh";
          URLTemplate = "https://hub.docker.com/search?q={searchTerms}";
          IconURL = "https://hub.docker.com/favicon.ico";
        }
        {
          Name = "GitHub";
          Alias = "@gh";
          URLTemplate = "https://github.com/search?q={searchTerms}";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "GitHub Code";
          Alias = "@ghc";
          URLTemplate = "https://github.com/search?type=code&q={searchTerms}";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "Nix Packages";
          Alias = "@nxp";
          URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
          IconURL = "https://nixos.org/favicon.ico";
        }
        {
          Name = "Nix Settings";
          Alias = "@nxs";
          URLTemplate = "https://search.nüschtos.de/?option_scope=7&query={searchTerms}";
          IconURL = "https://search.nüschtos.de/favicon.ico";
        }
      ];
    };
  };
}