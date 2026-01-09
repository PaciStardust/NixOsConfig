{
  pkgs,
  ...
}:{
  home-manager.users.paci.programs.tmux = {
    enable = true;

    clock24 = true;

    extraConfig = ''
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';

    plugins = with pkgs; [
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @plugin 'catppuccin/tmux#latest'
          set -g @catppuccin_flavor 'macchiato'

          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator "  █"

          set -g @catppuccin_window_default_fill "number"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#{pane_current_path}"

          set -g @catppuccin_status_modules_right "host user session application date_time"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_fill "all"
          set -g @catppuccin_status_connect_separator "yes"

          set -g @catppuccin_application_icon " "
          set -g @catppuccin_session_icon " "
          set -g @catppuccin_host_icon " "
          set -g @catppuccin_user_icon " "
          set -g @catppuccin_date_time_icon " "
        '';
      }
    ];
  };
}