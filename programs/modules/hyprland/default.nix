{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    flameshot
    playerctl
    waybar
    wofi
    yazi
  ];

  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };
  xdg.configFile."hypr".source = ../hyprland;
}
