{ ... }:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      monitor=HDMI-A-1,1920x1080@60,0x0,1
      monitor=DP-1,1920x1080@60,1920x0,1
      monitor=Unknown-1,disable
    '';
  };
}
