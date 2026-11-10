{
  config, 
  lib, 
  ...
}:{
  options.strdst-desktop-tweaks.gnome.enable = lib.mkEnableOption "STRDST Gnome Personalized";
  
  config = lib.mkIf config.strdst-desktop-tweaks.gnome.enable {
    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        mru-sources = [ (lib.hm.gvariant.mkTuple ["xkb" "us+altgr-intl"]) ];
        sources = [ (lib.hm.gvariant.mkTuple ["xkb" "us+intl"]) ];
        xkb-options = [ "terminate:ctrl_alt_bksp" ];
      };

      "org/gnome/desktop/interface" = {
        accent-color = "teal";
        color-scheme = "prefer-dark";
        enable-animations = true;
        enable-hot-corners = true;
        "show-battery-percentage" = true;
      };

      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
        left-handed = false;
        natural-scroll = false;
        speed = 0.325;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        click-method = "areas";
        disable-while-typing = false;
        edge-scrolling-enabled = false;
        natural-scroll = false;
        send-events = "enabled";
        speed = 0.23;
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/screensaver" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
        primary-color = "#241f31";
        secondary-color = "#000000";
      };

      "org/gnome/desktop/search-providers" = {
        disabled = [ "org.gnome.Epiphany.desktop" ];
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
        workspaces-only-on-primary = false;
      };

      "org/gnome/settings-daemon/plugins/power" = {
        idle-dim = true;
        power-button-action = "suspend";
        power-saver-profile-on-low-battery = true;
        sleep-inactive-ac-timeout = 900;
        sleep-inactive-ac-type = "suspend";
        sleep-inactive-battery-timeout = 900;
        sleep-inactive-battery-type = "suspend";
      };

      "org/gnome/shell" = {
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx" 
          "caffeine@patapon.info"
          "just-perfection-desktop@just-perfection"
          "azwallpaper@azwallpaper.gitlab.com"
          "Vitals@CoreCoding.com"
        ];
        favorite-apps = [
          "signal.desktop"
          "discord.desktop"
          "librewolf.desktop"
          "spotify.desktop"
          "tutanota-desktop.desktop"
          "foot.desktop"
          "code.desktop"
          "steam.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        last-selected-power-profile = "power-saver";
      };

      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };

      "org/gnome/shell/extensions/azwallpaper" = {
        prefs-visible-page = "";
        slideshow-directory = "/home/shared/wallpapers";
        slideshow-pause-notifications = false;
        slideshow-queue-reshuffle-on-complete = true;
        slideshow-slide-duration = (lib.hm.gvariant.mkTuple [0 30 0]);
        slideshow-use-absolute-time-for-duration = true;
        # slideshow-pause = false;
      };

      "org/gnome/shell/extensions/caffeine" = {
        cli-toggle = false;
        indicator-position-max = 1;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        accent-color-icon = false;
        workspace-wrap-around = true;
      };

      "org/gnome/shell/extensions/vitals" = {
        hot-sensors = [ "__network-rx_max__" "__network-tx_max__" ];
        include-public-ip = false;
        position-in-panel = 0;
        show-fan = false;
        show-gpu = false;
        show-storage = false;
        show-system = false;
        show-temperature = false;
        show-voltage = false;
      };

      "org/gnome/nautilus/icon-view" = {
        default-zoom-level = "small-plus";
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };

      "org/gnome/nautilus/preferences" = {
        show-delete-permanently = true;
        date-time-format = "detailed";
      };
    };
  };
}
