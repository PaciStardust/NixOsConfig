{
  config, 
  lib, 
  ...
}:{
  options.strdst-programs.foot.enable = lib.mkEnableOption "STRDST Foot";
  
  config = lib.mkIf config.strdst-programs.foot.enable {
    programs.foot = {
      enable = true;

      settings = {
        colors.alpha = 0.75;
        main.font = "JetBrainsMono:size=10";
      };
    };
  };
}
