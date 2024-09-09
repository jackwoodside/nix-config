{ pkgs, ... }:

{
  # Imports
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    jabref
    julia
    prusa-slicer
    openscad
  ];
}
