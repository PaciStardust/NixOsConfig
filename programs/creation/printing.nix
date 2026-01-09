{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    orca-slicer
  ];
}