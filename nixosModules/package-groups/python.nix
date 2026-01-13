{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-package-groups.python.enable = lib.mkEnableOption "STRDST Python Package Group";
  
  config = lib.mkIf config.strdst-package-groups.python.enable {
    environment.systemPackages = with pkgs; [
      python315
    ];
  };
}