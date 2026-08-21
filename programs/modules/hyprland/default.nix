{ pkgs, ... }:

{
  home.packages =
    with pkgs;
    [
      brightnessctl
      playerctl
      waybar
      wofi
      yazi
    ]
    ++ (with pkgs.unstable; [
      flameshot
    ]);

  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };
  xdg.configFile."hypr".source = ../hyprland;
}
