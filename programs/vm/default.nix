{
  pkgs,
  ...
}:{
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      qemu_full
      libvirt
      guestfs-tools
      edk2-uefi-shell
  ];
}