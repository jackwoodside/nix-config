{ pkgs, ... }:

{
  # Imports
  imports = [
    ./hyprland.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [ webcord ];
}
