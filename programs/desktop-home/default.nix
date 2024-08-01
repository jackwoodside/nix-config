{ pkgs, ... }:

{
  # Imports
  imports = [ ./spotify.nix ];

  home.packages = with pkgs; [ webcord ];
}
