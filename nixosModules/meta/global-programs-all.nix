{
  config, 
  lib,
  ...
}:{
  imports = [
    ../global-programs
  ];

  options.strdst-meta.global-programs-all.enable = lib.mkEnableOption "STRDST META-Global-Programs All";
  
  config = lib.mkIf config.strdst-meta.global-programs-all.enable {
    strdst-global-programs.steam.enable = true;
    strdst-global-programs.chromium.enable = true;
    strdst-global-programs.virt-manager.enable = true;
  };
}
