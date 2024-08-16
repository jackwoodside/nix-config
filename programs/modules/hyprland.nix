{ lib, pkgs, ... }:

{
  wayland.windowManager.hyprland =
    let
      kitty = "${lib.getExe pkgs.kitty}";
      playerctl = "${lib.getExe pkgs.playerctl}";
      wofi = "${lib.getExe pkgs.wofi}";
    in
    {
      enable = true;
      settings = {
        # Autostart
        exec-once = [ "waybar" ];

        # Bindings
        "$mod" = "SUPER";
        bind = [
          "$mod, Return, exec, ${kitty}"

          # Media
          ", XF86AudioPlay, exec, ${playerctl} play-pause"
          ", XF86AudioPrev, exec, ${playerctl} previous"
          ", XF86AudioNext, exec, ${playerctl} next"

          # Menus
          "$mod, space, exec, ${wofi}"

          # Resizing
          "$mod, r, submap, resize" # Submap defined at the end

          # Windows
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"

          "$mod, x, movecurrentworkspacetomonitor, +1"

          "$mod SHIFT, space, togglefloating"

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
        bindm = [ "$mod, mouse:272, movewindow" ];

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

        workspace = [
          "1, defaultName:"
          "2, defaultName:"
          "3, defaultName:"
          "4, defaultName:"
          "5, defaultName:"
          "6, defaultName:"
          "7, defaultName:"
          "8, defaultName:"
          "9, defaultName:"
        ];

        xwayland = {
          force_zero_scaling = true;
        };

        # Windows
        windowrulev2 = [
          "noborder, fullscreen:1"
          "float, class:(kitty), title:(pulsemixer)"
        ];
      };

      # Submaps
      extraConfig = ''
        submap=resize

        binde=,left,resizeactive,-10 0
        binde=,right,resizeactive,10 0
        binde=,up,resizeactive,0 -10
        binde=,down,resizeactive,0 10

        binde=SHIFT,left,resizeactive,-1 0
        binde=SHIFT,right,resizeactive,1 0
        binde=SHIFT,up,resizeactive,0 -1
        binde=SHIFT,down,resizeactive,0 1

        bind=,escape,submap,reset 
        submap=reset
      '';
    };
}
