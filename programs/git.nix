{
  ...
}:{
  home-manager.users.paci.programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      user.Name = "PaciStardust";
      user.Email = "git@paci.dev";
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
}