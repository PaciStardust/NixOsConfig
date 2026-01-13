{
  config, 
  lib, 
  ...
}:{
  options.strdst-cli.hyfetch.enable = lib.mkEnableOption "STRDST Hyfetch";
  
  config = lib.mkIf config.strdst-cli.hyfetch.enable {
    programs.hyfetch = {
      enable = true;

      settings = {
        preset = "nonbinary";
        mode = "rgb";
        brightness = 0.65;
        color_align = {
          mode = "horizontal";
        };
        backend = "neofetch";
        pride_month_disable = false;
        auto_detect_light_dark = true;
      };
    };
  };
}
