{ pkgs, ... }:

{
  # Imports
  imports = [
    ../modules/spotify.nix

    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [ webcord ];
}
