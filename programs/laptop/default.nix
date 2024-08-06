{ ... }:

{
  # Imports
  imports = [
    ../modules/discord.nix

    ./hyprland.nix
    ./waybar.nix
  ];

  # home.packages = with pkgs; [ ];
}
