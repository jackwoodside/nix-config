{ pkgs, ... }:

{
  # Imports
  imports = [
    ../modules/discord.nix

    ./hypridle.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  # home.packages = with pkgs; [ ];
}
