{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-displaymanagers.ly.enable = lib.mkEnableOption "STRDST LY Displaymanager";
  
  config = lib.mkIf config.strdst-displaymanagers.ly.enable {
    environment.systemPackages = [
      pkgs.brightnessctl
    ];

    services.displayManager.enable = true;
    services.displayManager.ly = {
      enable = true;
      settings =
      let
        base_run_path = "/run/current-system";
        brightnessctl_path = "${base_run_path}/sw/bin/brightnessctl";
        systemctl_path = "${base_run_path}/systemd/bin/systemctl";
      in
      {
        # Animation - Game Of Life # does not look as nice imo
        # animation = "gameoflife";
        gameoflife_entropy_interval = 50;
        gameoflife_fg = "0x0000FF00";
        gameoflife_frame_delay = 6;
        gameoflife_initial_density = 0.4;

        # Animation - ColorMix
        animation = "colormix";
        colormix_col1 = "0x800000ff";
        colormix_col2 = "0x807777ff";
        colormix_col3 = "0x02000000";

        # Core look
        #asterisk = "0x2727";
        bigclock = "en";
        battery_id = "BAT1";
        bg = "0x00000000";
        blank_box = true;
        border_fg = "0x009999FF";
        box_title = "-[ Stardust Collecive Device 7-2-222-444 ]";
        error_bg = "0x00000000";
        error_fg = "0x015500FF";
        fg = "0x00FFFFFF";
        text_in_center = true;

        # Funtionality
        clear_password = true;
        # default_input = "password";
        save = true;
        session_log = false;

        # Key Fixes
        # https://github.com/fairyglade/ly/blob/master/res/config.ini
        brightness_down_cmd = "${brightnessctl_path} -q s 10%-";
        brightness_down_key = "F8";
        brightness_up_cmd = "${brightnessctl_path} -q s +10%";
        brightness_up_key = "F9";
        sleep_cmd = "${systemctl_path} sleep";
        sleep_key = "F12";
      };
    };

    # Needed for PAM unlock
    security.pam.services.ly = {
      enableGnomeKeyring = true;
      startSession = true;
      kwallet = {
        enable = true;
        forceRun = true;
        package = pkgs.kdePackages.kwallet-pam;
      };
    };

    # copied from ly repo, using absolute path to pam_systemd.so or it would error
    # security.pam.services.ly-autologin = {
    #   text = ''
    #     auth       required     pam_permit.so
    #     -auth      optional     pam_gnome_keyring.so
    #     -auth      optional     pam_kwallet5.so

    #     account    include      login

    #     password   include      login
    #     -password  optional     pam_gnome_keyring.so use_authtok

    #     -session   optional     ${config.systemd.package}/lib/security/pam_systemd.so       class=greeter
    #     -session   optional     pam_elogind.so
    #     session    include      login
    #     -session   optional     pam_gnome_keyring.so auto_start
    #     -session   optional     pam_kwallet5.so      auto_start
    #   '';
    # };
  };
}
