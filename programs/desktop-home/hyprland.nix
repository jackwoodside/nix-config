{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        output = "HDMI-A-1";
        mode = "1920x1080@60";
        position = "1920x0";
        scale = "1";
      }
      {
        output = "DP-1";
        mode = "1920x1080@60";
        position = "0x0";
        scale = "1";
      }
      {
        output = "Unknown-1";
        disabled = true;
      }
    ];
  };
}
