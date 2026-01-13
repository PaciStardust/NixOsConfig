{
  config,
  lib,
  ...
}:{
  options.strdst-programs.discord.enable = lib.mkEnableOption "STRDST Discord";

  config = lib.mkIf config.strdst-programs.discord.enable {
    programs.discord = {
      enable = true;
      settings.SKIP_HOST_UPDATE = true;
    };
  };
}