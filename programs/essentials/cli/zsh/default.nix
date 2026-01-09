{
  pkgs,
  lib,
  ...
}:
let
  COLOR_MAIN_LIGHT = "81";
  COLOR_MAIN = "75";
  COLOR_MAIN_DARK = "69";
  COLOR_MAIN_DARKER = "68";

  COLOR_ALT_LIGHT = "141";
  COLOR_ALT = "135";
  COLOR_ALT_DARK = "99";
  COLOR_ALT_DARKER = "97";

  COLOR_OK = "119";
  COLOR_WARN = "221";
in{
  programs.zsh.enable = true;
  users.users.paci.shell = pkgs.zsh;

  environment.pathsToLink = [ "/share/zsh" ];  

  home-manager.users.paci = {
    home.file.".p10k.zsh".source = ./.p10k.zsh;
    home.file.".config/functions/fzf-preview.sh" = {
      source = ./fzf-preview.sh;
      executable = true;
    };

    home.packages = with pkgs; [
      zsh-powerlevel10k
      fzf
      zsh-fzf-tab
      fd
    ];
  };

  home-manager.users.paci.programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "ls --color";
      vim = "nvim";
      nano = "nvim";
      cls = "clear";
      clr = "clear";
      cat = "bat";
    };

    history = {
      append = true;
      expireDuplicatesFirst = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      save = 10000;
      saveNoDups = true;
      share = true;
      size = 10000;
      ignoreSpace = true;
    };

    syntaxHighlighting = {
      enable = true;
      styles = {
        command = "fg=${COLOR_MAIN_LIGHT}";
        precommand = "fg=${COLOR_WARN},bold,underline";
        unknown-token = "fg=${COLOR_ALT_LIGHT},bold";
        arg0 = "fg=${COLOR_MAIN_LIGHT}";
        suffix-alias = "fg=${COLOR_MAIN_LIGHT},underline";
      };
    };

    autosuggestion = {
      enable = true;
      strategy = [
        "completion"
        "history"
      ];
      highlight = "fg=${COLOR_ALT_DARKER}";
    };

    enableCompletion = true;

    initContent = 
      let initExtraFirst = lib.mkOrder 500 ''
        # Init for P10k
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        # Init for PATH
        export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
      ''; 
      initExtraBeforeCompInit = lib.mkOrder 550 ''
      '';
      initExtra = lib.mkOrder 1000 ''
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

        bindkey '^[[A' up-line-or-search

        bindkey '^ ' autosuggest-accept
        bindkey '^e' autosuggest-execute
        bindkey '^s' autosuggest-fetch
        bindkey '^t' autosuggest-toggle

        # Enables case insensitive completion
        zstyle ':completion:*' matcher-list 'm:{A-Za-z}={A-Za-z}'
        # Colorful LS
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

        #FZF
        source ${pkgs.fzf}/share/fzf/key-bindings.zsh
        source ${pkgs.fzf}/share/fzf/completion.zsh
        # Theme (Cattpucchin Macchiato, No BG)

        FZF_THEME="\
        --color=spinner:#f4dbd6,hl:#ed8796,\
        fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6,\
        marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

        # Reverses the order
        FZF_DEFAULT_OPTS="--layout reverse --multi ''${FZF_THEME}"

        # Using FD instead of Find
        FZF_FD_OPTS="--hidden --follow --exclude '.git'"
        FZF_DEFAULT_COMMAND="fd ''${FZF_FD_OPTS}"
        FZF_CTRL_T_COMMAND="''${FZF_DEFAULT_COMMAND}"
        FZF_ALT_C_COMMAND="''${FZF_DEFAULT_COMMAND} --type d"

        # Preview
        FZF_DEFAULT_OPTS+=" --preview '~/.config/functions/fzf-preview.sh {}'"
        FZF_CTRL_R_OPTS="--no-preview"

        # Disable default completion menu
        zstyle ':completion:*' menu no
        # Set min heigt
        zstyle ':fzf-tab:complete:*' fzf-min-height 16
        # Set theme
        zstyle ':fzf-tab:*' fzf-flags ''${FZF_THEME}

        # Preview files and directories
        zstyle ':fzf-tab:complete:*' fzf-preview '~/.config/functions/fzf-preview.sh $realpath'

        # Enable TMUX Popup
        # zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
        # zstyle ':fzf-tab:*' popup-min-size 64 16

        enable-fzf-tab
      '';
      initLastToRun = lib.mkOrder 1500 ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      ''; 
      in lib.mkMerge [ initExtraFirst initExtraBeforeCompInit initExtra initLastToRun ];

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
      ];
    };
  };
}