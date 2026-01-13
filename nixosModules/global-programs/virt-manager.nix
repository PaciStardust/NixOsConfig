{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-global-programs.virt-manager.enable = lib.mkEnableOption "STRDST Virt-Manager";
  
  config = lib.mkIf config.strdst-global-programs.virt-manager.enable {
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      qemu_full
      libvirt
      guestfs-tools
      edk2-uefi-shell
    ];
  };
}