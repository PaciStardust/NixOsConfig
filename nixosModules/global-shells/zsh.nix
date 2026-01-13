{
  config, 
  lib,
  ...
}:{
  options.strdst-global-shells.zsh.enable = lib.mkEnableOption "STRDST Global Zsh Shell";
  
  config = lib.mkIf config.strdst-global-shells.zsh.enable {
    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ];  
  };
}