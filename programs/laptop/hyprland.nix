{ ... }:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      monitor=eDP-1,1920x1080@60,320x1440,1
      monitor=DP-1,3840x2160@60,0x0,1.5
    '';
  };
}
