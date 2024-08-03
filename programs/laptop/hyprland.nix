{ ... }:

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      monitor=eDP-1,1920x1080@60,960x2160,1
      monitor=DP-1,3840x2160@60,0x0,1
    '';
  };
}
