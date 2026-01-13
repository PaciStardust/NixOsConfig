{
  config, 
  lib, 
  pkgs, 
  ...
}:{
  options.strdst-package-groups.rust.enable = lib.mkEnableOption "STRDST Rust Package Group";
  
  config = lib.mkIf config.strdst-package-groups.rust.enable {
    environment.systemPackages = with pkgs; [
      cargo
      rustc
      rustlings
      rust-analyzer
    ];
  };
}