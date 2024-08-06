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
    ./gtk.nix
    ./helix.nix
    ./htop.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./mpv.nix
    ./networkmanager-dmenu.nix
    ./sioyek.nix
    ./starship.nix
    ./udiskie.nix
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
