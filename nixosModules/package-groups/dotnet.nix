{
  config, 
  lib, 
  pkgs, 
  ...
}:
let 
  dotnet_combined = with pkgs.dotnetCorePackages; combinePackages[
    sdk_10_0
    sdk_9_0
    sdk_8_0
    runtime_10_0
    runtime_9_0
    runtime_8_0
    aspnetcore_10_0
    aspnetcore_9_0
    aspnetcore_8_0
  ];
in{
  options.strdst-package-groups.dotnet.enable = lib.mkEnableOption "STRDST .NET Package Group";
  
  config = lib.mkIf config.strdst-package-groups.dotnet.enable {
    environment.systemPackages = [
      dotnet_combined
    ];

    environment.variables = {
      DOTNET_ROOT = dotnet_combined;
      DOTNET_CLI_TELEMETRY_OPTOUT = 1;
      DOTNET_SKIP_FIRST_TIME_EXPERIENCE = 1;
    };
  };
}