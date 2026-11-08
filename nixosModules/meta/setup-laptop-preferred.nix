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

  options.strdst-meta.setup-laptop-preferred.enable = lib.mkEnableOption "STRDST META-Setup Laptop-Preferred";
  
  config = lib.mkIf config.strdst-meta.setup-laptop-preferred.enable {
    strdst-meta.setup-desktop-preferred.enable = true;
    strdst-core.laptop-base.enable = true;
  };
}
