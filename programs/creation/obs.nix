{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    obs-studio
  ];
}