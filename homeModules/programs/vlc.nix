{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.vlc.enable = lib.mkEnableOption "STRDST VLC";
  
  config = lib.mkIf config.strdst-programs.vlc.enable {
    home.packages = with pkgs; [ 
      vlc
      ffmpeg
    ];
  };
}
