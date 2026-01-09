{
  ...
}:{
  home-manager.users.paci.programs.obsidian = {
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
}