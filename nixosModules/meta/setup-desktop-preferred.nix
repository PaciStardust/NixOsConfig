{
  config, 
  lib,
  ...
}:{
  imports = [
    ../core
    ../displaymanagers
    ../desktops
  ];

  options.strdst-meta.setup-desktop-preferred.enable = lib.mkEnableOption "STRDST META-Setup Desktop-Preferred";
  
  config = lib.mkIf config.strdst-meta.setup-desktop-preferred.enable {
    strdst-core.secure-boot.enable = true;
    strdst-core.desktop-base.enable = true;
    strdst-displaymanagers.ly.enable = true;
    strdst-desktops.plasma.enable = true;
  };
}
