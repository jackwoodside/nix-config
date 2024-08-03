{ pkgs, ... }:

{
  # Imports
  imports = [ ./hyprland.nix ];

  home.packages = with pkgs; [ webcord ];
}
