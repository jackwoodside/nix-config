{ pkgs, ... }:

{
  # Imports
  imports = [
    ../modules/discord.nix

    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    jellyfin-media-player
    obs-studio
    prusa-slicer
    spotify
    steam
    zathura
  ];
}
