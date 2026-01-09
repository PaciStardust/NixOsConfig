{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    libreoffice
  ];
}