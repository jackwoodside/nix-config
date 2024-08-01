{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      # Bindings
      bind = [
        "$mod, Return, exec, ${pkgs.kitty}/bin/kitty"

        # Media
        # "XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        # "XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        # "XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"

        # Menus
        "$mod, space, exec, ${pkgs.wofi}/bin/wofi -S drun"

        # Windows
        "$mod, f, fullscreen, 1"
        "$mod SHIFT, f, fullscreen, 0"
        "$mod SHIFT, q, killactive"

        # Workspaces
        # "$mod, 1, workspace 1"
        # "$mod SHIFT, 1, movetoworkspace 1"
        # "$mod, 2, workspace 2"
        # "$mod SHIFT, 2, movetoworkspace 2"
        # "$mod, 3, workspace 3"
        # "$mod SHIFT, 3, movetoworkspace 3"
        # "$mod, 4, workspace 4"
        # "$mod SHIFT, 4, movetoworkspace 4"
        # "$mod, 5, workspace 5"
        # "$mod SHIFT, 5, movetoworkspace 5"
        # "$mod, 6, workspace 6"
        # "$mod SHIFT, 6, movetoworkspace 6"
        # "$mod, 7, workspace 7"
        # "$mod SHIFT, 7, movetoworkspace 7"
        # "$mod, 8, workspace 8"
        # "$mod SHIFT, 8, movetoworkspace 8"
        # "$mod, 9, workspace 9"
        # "$mod SHIFT, 9, movetoworkspace 9"
      ];
      binde = [
        # Audio
        # "XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
        # "XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
        # "XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
      };

      misc = {
        disable_hyprland_logo = true;
      };
    };
  };
}
