{
  pkgs,
  inputs,
  ...
}:
let
  lagtrain = (pkgs.fetchgit {
    url = "https://github.com/dgudim/themes.git";
    rev = "496cdec18fc5d89e9e9bbb93faca6d481a006b31";
    sparseCheckout = [
      "KDE-loginscreens/Lagtrain"
    ];
    hash = "sha256-qoUKc6m/Fp8o0DljVBXKJ68j7zFGT3P3rVbe4Y9NzZw=";
  });
  moedark = (pkgs.fetchgit {
    url = "https://gitlab.com/jomada/moe-dark.git";
    rev = "369fe9a2748dad2133a11faaa73da9f286ce7c39";
    sparseCheckout = [
      "aurorae/MoeDark"
    ];
    hash = "sha256-TNAJ0mV5b0TumJugiAtuUWdCFbqTujcdBfT76LojLAA=";
  });
in{
  home-manager.users.paci = {
    imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
    home.file.".local/share/plasma/look-and-feel/Lagtrain".source = "${lagtrain}/KDE-loginscreens/Lagtrain";
    home.file.".local/share/aurorae/themes/MoeDark".source = "${moedark}/aurorae/MoeDark";
  };

  environment.systemPackages = with pkgs; [
    material-cursors
    (papirus-icon-theme.override {
      color = "breeze"; 
    })
  ];

  home-manager.users.paci.programs.plasma = {
    enable = true;

    powerdevil = {
      AC = {
        dimDisplay.idleTimeout = 600;
        turnOffDisplay.idleTimeout = 900;
        turnOffDisplay.idleTimeoutWhenLocked = 120;
        autoSuspend.idleTimeout = 1200;
      };
      battery = {
        dimDisplay.idleTimeout = 300;
        turnOffDisplay.idleTimeout = 600;
        turnOffDisplay.idleTimeoutWhenLocked = 60;
        autoSuspend.idleTimeout = 900;
      };
      lowBattery = {
        dimDisplay.idleTimeout = 120;
        turnOffDisplay.idleTimeout = 300;
        turnOffDisplay.idleTimeoutWhenLocked = 60;
        autoSuspend.idleTimeout = 600;
        powerProfile = "powerSaving";
        displayBrightness = 30;
      };
    };

    fonts = {
      general = {
        family = "Noto Sans";
        pointSize = 10;
      };
      fixedWidth = {
        family = "JetBrains Mono";
        pointSize = 10;
      };
      small = {
        family = "Noto Sans";
        pointSize = 8;
      };
      toolbar = {
        family = "Noto Sans";
        pointSize = 10;
      };
      menu = {
        family = "Noto Sans";
        pointSize = 10;
      };
      windowTitle = {
        family = "Noto Sans";
        pointSize = 10;
      };
    };

    input = {
      touchpads = [
        {
          enable = true;
          name = "PIXA3854:00 093A:0274 Touchpad";
          productId = "0274";
          vendorId = "093a";
          disableWhileTyping = false;
          pointerSpeed = 0.2;
          accelerationProfile = "default";
          scrollSpeed = 0.75;
        }
      ];
    };

    workspace = {
      theme = "default";
      colorScheme = "BreezeDark";
      cursor = {
        size = 32;
        theme = "material_light_cursors";
      };
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      wallpaperSlideShow = { 
        path = "/home/shared/wallpapers/"; 
        interval = 600;
      };
      splashScreen.theme = "Lagtrain";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "__aurorae__svg__MoeDark";
      };
      widgetStyle = "Breeze";
    };

    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = true;
      historyBehavior = "enableSuggestions";
    };

    kscreenlocker = {
      autoLock = true;
      lockOnResume = true;
      timeout = 10;
      passwordRequired = true;
      passwordRequiredDelay = 5;
      appearance = {
        alwaysShowClock = true;
        showMediaControls = true;
        wallpaperSlideShow = { 
          path = "/home/shared/wallpapers/"; 
          interval = 86400;
        };
      };
    };

    kwin = {
      effects = {
        shakeCursor.enable = true;
        windowOpenClose.animation = "fade";
        desktopSwitching = {
          animation = "slide";
          navigationWrapping = true;
        };
      };

      virtualDesktops = {
        rows = 1;
        number = 4;
        names = [
          "Social"
          "Work A"
          "Work B"
          "Extra"
        ];
      };

      borderlessMaximizedWindows = false;
      tiling.padding = 0; # used to be 4?
    };

    panels = [
      {
        location = "bottom";
        floating = true;
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          {
            pager.general = {
              showApplicationIconsOnWindowOutlines = true;
              navigationWrapsAround = true;
            };
          }
          "org.kde.plasma.icontasks" #todo: fix hardcode?
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    session = {
      sessionRestore.restoreOpenApplicationsOnLogin = "whenSessionWasManuallySaved";
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;

      krunnerrc."Plugins/Favorites" = {
        plugins = "krunner_sessions,krunner_services,krunner_systemsettings";
      };

      kdeglobals.General.AccentColor = "30,111,233";

      kwinrc.Windows.DelayFocusInterval = 100;
      kwinrc.Xwayland.Scale = 1.5;
      kwinrc."Effect-shakecursor".Magnification = 2;

      klipperrc.General = {
        IgnoreImages = false;
        KeepClipboardContents = false;
        MaxClipItems = 1;
      };  

      plasmanotifyrc = {
        DoNotDisturb = {
          WhenFullscreen = false;
          WhenScreenSharing = false;
          WhenScreensMirrored = false;
        };
        Notifications = {
          PopupPosition = "BottomRight";
        };
      };
    };
  };
}