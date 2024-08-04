{ pkgs, ... }:

{
  # Imports
  imports = [
    ./hyprland.nix
    ./spotify.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [ webcord ];
}
