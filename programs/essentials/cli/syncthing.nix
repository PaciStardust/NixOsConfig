{
  ...
}:{
  home-manager.users.paci.services.syncthing = {
    enable = true;
    settings = {
      gui = {
        metricsWithoutAuth = false;
      };
      options = {
        startBrowser = false;
        urPostInsecurely = false;
        minHomeDiskFree = "10%";
        overwriteRemoteDeviceNamesOnConnect = true;
      };
    };
  };
}