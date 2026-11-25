{
  config, 
  lib, 
  ...
}:{
  options.strdst-core.amd.enable = lib.mkEnableOption "STRDST Core AMD";
  
  config = lib.mkIf config.strdst-core.amd.enable {    
    # Load KMS early like arch
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "amdgpu" "kvm-amd" ];
  };
}
