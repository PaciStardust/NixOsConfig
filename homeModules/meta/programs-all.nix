{
  config, 
  lib,
  ...
}:{
  imports = [
    ../programs
  ];

  options.strdst-meta.programs-all.enable = lib.mkEnableOption "STRDST META-Programs All";
  
  config = lib.mkIf config.strdst-meta.programs-all.enable {
    strdst-programs.bitwarden.enable = true;
    strdst-programs.blender.enable = true;
    strdst-programs.discord.enable = true;
    strdst-programs.firefox.enable = true;
    strdst-programs.foot.enable = true;
    strdst-programs.heroic.enable = true;
    strdst-programs.krita.enable = true;
    strdst-programs.libreoffice.enable = true;
    strdst-programs.obs-studio.enable = true;
    strdst-programs.obsidian.enable = true;
    strdst-programs.orca-slicer.enable = true;
    strdst-programs.parsec.enable = true;
    strdst-programs.prismlauncher.enable = true;
    strdst-programs.signal.enable = true;
    strdst-programs.spotify.enable = true;
    strdst-programs.tuta.enable = true;
    strdst-programs.unity.enable = true;
    strdst-programs.vlc.enable = true;
    strdst-programs.vscode.enable = true;
  };
}
