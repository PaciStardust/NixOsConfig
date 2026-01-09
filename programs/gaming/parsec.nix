{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    parsec-bin
  ];
}