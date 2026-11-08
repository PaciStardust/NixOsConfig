{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  imports = [
    ./desktop-base.nix
  ];

  options.strdst-core.laptop-base.enable = lib.mkEnableOption "STRDST Core Laptop Base";
  
  config = lib.mkIf config.strdst-core.laptop-base.enable {
    strdst-core.desktop-base.enable = true;

    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
