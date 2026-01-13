{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-package-groups.nodejs.enable = lib.mkEnableOption "STRDST NodeJs Package Group";
  
  config = lib.mkIf config.strdst-package-groups.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs_latest
    ];
  };
}