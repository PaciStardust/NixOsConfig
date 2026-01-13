{
  config, 
  lib,
  ...
}:{
  imports = [
    ../package-groups
  ];

  options.strdst-meta.package-groups-all.enable = lib.mkEnableOption "STRDST META-Package-Groups All";
  
  config = lib.mkIf config.strdst-meta.package-groups-all.enable {
    strdst-package-groups.dotnet.enable = true;
    strdst-package-groups.nodejs.enable = true;
    strdst-package-groups.python.enable = true;
    strdst-package-groups.rust.enable = true;
  };
}
