{
  config, 
  lib, 
  ...
}:{
  options.strdst-global-programs.docker.enable = lib.mkEnableOption "STRDST Docker";

  config = lib.mkIf config.strdst-global-programs.docker.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}