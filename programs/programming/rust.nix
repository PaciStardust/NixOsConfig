{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustlings
    rust-analyzer
  ];
}