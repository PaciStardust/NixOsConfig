{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs; [
    python315
  ];
}