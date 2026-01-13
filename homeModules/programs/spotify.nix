{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.spotify.enable = lib.mkEnableOption "STRDST Spotify";

  config = lib.mkIf config.strdst-programs.spotify.enable {
    home.packages = with pkgs; [ spotify ];
  };
}
