{ pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Imports
  imports = [
    ./bat.nix
    ./dunst.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./hypridle.nix # TODO
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./networkmanager-dmenu.nix
    ./starship.nix
    ./waybar
  ];

  # Font management
  fonts.fontconfig.enable = true;

  # Misc. programs
  home.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })

    bitwarden-cli # TODO
    firefox # TODO
  ];
}
