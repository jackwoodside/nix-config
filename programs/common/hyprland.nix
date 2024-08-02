{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Autostart
      exec-once = [ "waybar" ];

      # Bindings
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, ${pkgs.kitty}/bin/kitty"

        # Media
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"

        # Menus
        "$mod, space, exec, ${pkgs.wofi}/bin/wofi -S drun"

        # Windows
        "$mod, f, fullscreen, 1"
        "$mod SHIFT, f, fullscreen, 0"
        "$mod SHIFT, q, killactive"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod, 2, workspace, 2"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod, 3, workspace, 3"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod, 4, workspace, 4"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod, 6, workspace, 6"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod, 7, workspace, 7"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod, 8, workspace, 8"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod, 9, workspace, 9"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"

        # Zoom
        "$mod, z, exec, hyprctl keyword cursor:zoom_factor 3.0"
        "$mod SHIFT, z, exec, hyprctl keyword cursor:zoom_factor 1.0"
      ];
      binde = [
        # Audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      # Settings
      general = {
        border_size = 2;
        "col.active_border" = "rgb(cdd6f4)";
        "col.inactive_border" = "rgb(585b70)";
        gaps_in = 5;
        gaps_out = 10;
      };

      cursor = {
        inactive_timeout = 3;
      };

      decoration = {
        blur = {
          enabled = false;
        };
        drop_shadow = false;
      };

      # layout
      dwindle = {
        force_split = 2;
        smart_resizing = false;
      };

      misc = {
        background_color = "rgb(1e1e2e)";
        disable_autoreload = true;
        disable_hyprland_logo = true;
        initial_workspace_tracking = 2;
      };

      # workspace = [ 
      # ];
    };
  };
}
