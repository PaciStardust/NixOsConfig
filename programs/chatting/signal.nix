{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    signal-desktop
  ];
}