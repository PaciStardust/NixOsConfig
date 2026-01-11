{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    tutanota-desktop
  ];
}