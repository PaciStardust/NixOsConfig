{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    unityhub
    alcom
    blender
  ];
}