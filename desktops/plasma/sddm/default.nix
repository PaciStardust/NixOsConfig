{
  pkgs,
  ...
}:{
  environment.systemPackages = [
    (pkgs.where-is-my-sddm-theme.override {
      variants = [ "qt6" ];
      themeConfig.General = {
        passwordCharacter = "✧";
        passwordMask = true;
        passwordInputWidth = 0.8;
        passwordInputBorderWidth = 0;
        passwordInputCursorVisible = true;
        passwordFontSize = 64;
        passwordCursorColor = "random";
        passwordTextColor = "#ffffff";
        passwordAllowEmpty = true;
        cursorBlinkAnimation = true;
        showSessionsByDefault = true;
        sessionsFontSize = 32;
        showUsersByDefault = true;
        usersFontSize = 48;
        showUserRealNameByDefault = true;
        background = "/home/shared/wallpaper_special.png";
        backgroundFillMode = "fill";
        basicTextColor = "#ffffff";
        blurRadius = 24;
        hideCursor = false;
        font = "Unifont";
        helpFont = "Unifont";
        helpFontSize = 18;
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings.General.DisplayServer = "wayland";
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
    theme = "where_is_my_sddm_theme";
  };
  services.displayManager.preStart = "${pkgs.bash}/bin/bash ${./wallpaper_hack.sh} >> /tmp/sddm-setup.log 2>&1";
} 
