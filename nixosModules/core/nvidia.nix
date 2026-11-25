{
  config, 
  lib, 
  ...
}:{
  options.strdst-core.nvidia.enable = lib.mkEnableOption "STRDST Core NVIDIA";
  options.strdst-core.cuda.enable = lib.mkEnableOption "STRDST Core CUDA";
  
  config = lib.mkIf config.strdst-core.nvidia.enable {    
    boot.blacklistedKernelModules = [
      "nova_core"
      "nouveau"
    ];
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia-container-toolkit.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    hardware.opengl = {
      enable = true;
    };
  };
}
