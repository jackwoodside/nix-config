{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1,1920x1080@60,0x0,1"
      "DP-1,1920x1080@60,1920x0,1"
      "Unknown-1,disable" # Fake monitor from NVidia driver bug
    ];
  };
}
