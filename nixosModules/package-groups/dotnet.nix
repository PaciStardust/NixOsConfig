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
  ];
in{
  options.strdst-package-groups.dotnet.enable = lib.mkEnableOption "STRDST .NET Package Group";
  
  config = lib.mkIf config.strdst-package-groups.dotnet.enable {
    environment.systemPackages = [
      dotnet_combined
      pkgs.netcoredbg
      pkgs.msbuild
      pkgs.omnisharp-roslyn
    ];

    environment.variables = {
      DOTNET_ROOT = "${dotnet_combined}/share/dotnet";
      DOTNET_CLI_TELEMETRY_OPTOUT = 1;
      DOTNET_SKIP_FIRST_TIME_EXPERIENCE = 1;
    };
  };
}