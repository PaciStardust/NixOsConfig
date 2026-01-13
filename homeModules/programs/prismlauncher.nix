{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-programs.prismlauncher.enable = lib.mkEnableOption "STRDST Prism Launcher";

  config = lib.mkIf config.strdst-programs.prismlauncher.enable {
    home.packages = with pkgs; [ prismlauncher ];
  };
}
