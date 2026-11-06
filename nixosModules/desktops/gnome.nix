{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-desktops.gnome.enable = lib.mkEnableOption "STRDST Gnome Desktop";
  
  config = lib.mkIf config.strdst-desktops.gnome.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome = {
      games.enable = false;
      sushi.enable = true;
      core-apps.enable = true;
      core-shell.enable = true;
      evolution-data-server.enable = true;
      gnome-online-accounts.enable = true;
      gcr-ssh-agent.enable = false;
    };

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.blur-my-shell
      gnomeExtensions.caffeine
      gnomeExtensions.appindicator
      gnomeExtensions.just-perfection
      gnomeExtensions.vitals
      gnomeExtensions.wallpaper-slideshow

      # Themes the app titlebars
      qadwaitadecorations
      qadwaitadecorations-qt6
      # Themes the apps
      qgnomeplatform
      qgnomeplatform-qt6
    ];
  };
}
