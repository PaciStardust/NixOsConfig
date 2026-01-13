{
  config, 
  lib,
  ...
}:{
  imports = [
    ../cli
  ];

  options.strdst-meta.cli-all.enable = lib.mkEnableOption "STRDST META-Cli All";
  
  config = lib.mkIf config.strdst-meta.cli-all.enable {
    strdst-cli.bat.enable = true;
    strdst-cli.git.enable = true;
    strdst-cli.hyfetch.enable = true;
    strdst-cli.tmux.enable = true;
  };
}
