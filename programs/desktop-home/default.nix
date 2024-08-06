{ ... }:

{
  # Imports
  imports = [
    ../modules/discord.nix
    ../modules/spotify.nix

    ./hyprland.nix
    ./waybar.nix
  ];

  # home.packages = with pkgs; [ ];
}
