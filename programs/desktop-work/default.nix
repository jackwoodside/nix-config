{ pkgs, ... }:

{
  # Imports
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    jabref
    julia_110-bin
    # mathematica
    prusa-slicer
    openscad
    remmina
    teams
  ];
}
