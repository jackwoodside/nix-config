{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1,3840x2160@60,1920x0,1.5"
      "HDMI-A-1,1920x1080@60,0x360,1"
    ];

    windowrulev2 = [ "tile, class:(ROOT)" ];
  };
}
