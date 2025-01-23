{
  config,
  lib,
  pkgs,
  ...
}:

let
  colours = config.colorScheme.hyprColors;

  bc = "${lib.getExe pkgs.bc}";
  brightnessctl = "${lib.getExe pkgs.brightnessctl}";
  eww = "${lib.getExe pkgs.eww}";
  grep = "${lib.getExe pkgs.ripgrep}";
  grim = "${lib.getExe pkgs.grim}";
  kitty = "${lib.getExe pkgs.kitty}";
  lf = "${lib.getExe pkgs.lf}";
  playerctl = "${lib.getExe pkgs.playerctl}";
  slurp = "${lib.getExe pkgs.slurp}";
  waybar = "${lib.getExe pkgs.waybar}";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  wofi = "${lib.getExe pkgs.wofi}";

  resize-x = pkgs.writeShellScript "resize-x.sh" ''
    X=$(hyprctl activewindow | ${grep} "size:" | tr "," " " | awk "{print \$2}")
    Y=$(hyprctl activewindow | ${grep} "size:" | tr "," " " | awk "{print \$3}")

    TEMP=$(printf "%.0f" $(echo "scale=6; $Y / 9" | ${bc}))
    Y=$(printf "%.0f" $(echo "scale=6; 9*$TEMP" | ${bc}))
    X=$(echo "16*$Y/9" | ${bc})

    hyprctl dispatch resizeactive exact $X $Y
  '';
  resize-y = pkgs.writeShellScript "resize-y.sh" ''
    X=$(hyprctl activewindow | ${grep} "size:" | tr "," " " | awk "{print \$2}")
    Y=$(hyprctl activewindow | ${grep} "size:" | tr "," " " | awk "{print \$3}")

    TEMP=$(printf "%.0f" $(echo "scale=6; $X / 16" | ${bc}))
    X=$(printf "%.0f" $(echo "scale=6; 16*$TEMP" | ${bc}))
    Y=$(echo "9*$X/16" | ${bc})

    hyprctl dispatch resizeactive exact $X $Y
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Autostart
      exec-once = [
        "${eww} daemon"
        "${waybar}"
      ];

      # Bindings
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, ${kitty}"

        # File Browser
        "$mod, w, exec, ${kitty} --class lf ${lf}"

        # Menus
        "$mod, space, exec, ${wofi}"
        ", Home, exec, ${grim} -g \"$(${slurp} -d -c '#00000000' -f 'JetBrains Mono')\" - | ${wl-copy}"

        # Resizing
        "$mod, r, submap, Resize" # Submap defined at the end

        # Windows
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "$mod, x, swapactiveworkspaces, current +1"
        "$mod SHIFT, x, movecurrentworkspacetomonitor, +1"

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

        # Workspaces - Special
        "$mod, Delete, togglespecialworkspace, scratchpad"

        # Zoom
        "$mod, z, exec, hyprctl keyword cursor:zoom_factor 3.0"
        "$mod SHIFT, z, exec, hyprctl keyword cursor:zoom_factor 1.0"
      ];

      # Bindings - Repeat
      binde = [ ];

      # Bindings - Lock Bypass
      bindl = [
        # Media
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, ${playerctl} play-pause"
        ", XF86AudioPrev, exec, ${playerctl} previous"
        ", XF86AudioNext, exec, ${playerctl} next"

        # Brightness
        ", XF86MonBrightnessUp, exec, ${brightnessctl} set 5%+"
        ", XF86MonBrightnessDown, exec, ${brightnessctl} set 5%-"
      ];

      # Bindings - Mouse
      bindm = [ "$mod, mouse:272, movewindow" ];

      # Settings
      general = {
        border_size = 2;
        "col.active_border" = colours.base05;
        "col.inactive_border" = colours.base04;
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
        shadow = {
          enabled = false;
        };
      };

      # layout
      dwindle = {
        force_split = 2;
        smart_resizing = false;
      };

      misc = {
        background_color = colours.base00;
        disable_autoreload = true;
        disable_hyprland_logo = true;
      };

      render = {
        explicit_sync = 0;
      };

      workspace = [
        # Toggle terminal
        "special:scratchpad, on-created-empty:${kitty} --class toggleterm"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      # Windows
      windowrulev2 = [
        "noborder, fullscreen:1"

        # Pulsemixer
        "float, class:(pulsemixer)"
        "size 60% 60%, class:(pulsemixer)"

        # Toggle terminal
        "float, class:(toggleterm)"
        "size 80% 80%, class:(toggleterm)"
      ];
    };

    # Submaps
    extraConfig = ''
      # Resize
      submap=Resize

      binde=,left,resizeactive,-10 0
      binde=,right,resizeactive,10 0
      binde=,up,resizeactive,0 -10
      binde=,down,resizeactive,0 10

      binde=SHIFT,left,resizeactive,-1 0
      binde=SHIFT,right,resizeactive,1 0
      binde=SHIFT,up,resizeactive,0 -1
      binde=SHIFT,down,resizeactive,0 1

      bind=,h,exec,${resize-x}
      bind=,v,exec,${resize-y}

      bind=,escape,submap,reset 
      bind=,Return,submap,reset 
      submap=reset
    '';
  };
}
