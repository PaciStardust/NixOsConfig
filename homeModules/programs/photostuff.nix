{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.photostuff.enable = lib.mkEnableOption "STRDST Photostuff";

  config = lib.mkIf config.strdst-programs.photostuff.enable {
    home.packages = with pkgs; [ 
      darktable
      digikam
    ];
  };
}