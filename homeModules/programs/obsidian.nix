{
  config,
  lib,
  ...
}:{
  options.strdst-programs.obsidian.enable = lib.mkEnableOption "STRDST Obsidian";

  config = lib.mkIf config.strdst-programs.obsidian.enable {
    programs.obsidian = {
      enable = true;

      defaultSettings = {
        app = {
          promptDelete = false;
          alwaysUpdateLinks = true;
          newFileLocation = "root";
        };
        appearance = {
          accentColor = "#5c6ef5";
        };
      };
    };
  };
}