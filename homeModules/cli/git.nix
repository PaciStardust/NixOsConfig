{
  config, 
  lib, 
  ...
}:{
  options.strdst-cli.git.enable = lib.mkEnableOption "STRDST Git";
  options.strdst-cli.git.user-name = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "Git Username";
  };
  options.strdst-cli.git.user-mail = lib.mkOption {
    type = lib.types.str;
    default = "";
    description = "Git User mail";
  };
  
  config = lib.mkIf config.strdst-cli.git.enable {
    programs.git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
        user.Name = config.strdst-cli.git.user-name;
        user.Email = config.strdst-cli.git.user-mail;
        extraConfig = {
          safe.directory = [ "/etc/nixos" ];
          blame.ignoreRevsFile = ".git-blame-ignore-revs";
        };
      };

      signing = {
        format = "ssh";
        signByDefault = true;
        key = "~/.ssh/id_rsa";
      };
    };
  };
}
