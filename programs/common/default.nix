{ pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Imports
  imports = [
    ./git.nix
    ./helix.nix
    ./hyprland.nix
    ./kitty.nix
    ./spotify.nix
  ];

  # Font management
  fonts.fontconfig.enable = true;

  # Misc. programs
  home.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    bitwarden-cli # TODO
    discord # TODO
    firefox # TODO
    kitty # TODO
  ];
}
