{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-package-groups.dotnet.enable = lib.mkEnableOption "STRDST .NET Package Group";
  
  config = lib.mkIf config.strdst-package-groups.dotnet.enable {
    environment.systemPackages = with pkgs; [
      dotnet-aspnetcore_10
      dotnet-aspnetcore_9
      dotnet-aspnetcore_8
      dotnet-sdk_10
      dotnet-sdk_9
      dotnet-sdk_8
      dotnet-runtime_10
      dotnet-runtime_9
      dotnet-runtime_8
    ];
  };
}