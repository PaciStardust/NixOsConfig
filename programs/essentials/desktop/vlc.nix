{
  pkgs,
  ...
}:{
  users.users.paci.packages = with pkgs; [
    vlc
    ffmpeg
  ];
}