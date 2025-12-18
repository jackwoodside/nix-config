{ pkgs, ... }:

{
  # Imports
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    inkscape
    jabref
    julia_110-bin
    prusa-slicer
    openscad
    remmina
    teams-for-linux
    virt-manager
  ];
}
