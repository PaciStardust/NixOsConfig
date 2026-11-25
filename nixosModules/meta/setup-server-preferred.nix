{
  config, 
  lib,
  ...
}:{
  imports = [
    ../core
  ];

  options.strdst-meta.setup-server-preferred.enable = lib.mkEnableOption "STRDST META-Setup Server-Preferred";
  
  config = lib.mkIf config.strdst-meta.setup-server-preferred.enable {
    strdst-core.secure-boot.enable = true;
    strdst-core.cli-base.enable = true;
    strdst-global-shells.zsh.enable = true;
  };
}
