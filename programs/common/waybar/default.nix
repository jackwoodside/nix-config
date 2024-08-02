{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "clock"
        ];
      };
    };
    style = ./catppuccin.css;
  };
}
