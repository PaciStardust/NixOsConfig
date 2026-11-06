{
  config,
  lib,
  ...
}:{
  options.strdst-programs.discord.enable = lib.mkEnableOption "STRDST Discord";

  config = lib.mkIf config.strdst-programs.discord.enable {
    home.file."${config.home.homeDirectory}/.config/discord/settings.json".force = true;
    programs.discord = {
      enable = true;
      settings.SKIP_HOST_UPDATE = true;
    };
  };
}