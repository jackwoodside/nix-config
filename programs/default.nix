{
  colorSchemes,
  lib,
  pkgs,
  ...
}:

{
  home.stateVersion = "24.05";

  # Imports
  imports = [
    ./modules/bat.nix
    ./modules/dunst.nix
    ./modules/fish.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/helix.nix
    ./modules/htop.nix
    ./modules/hypridle.nix
    ./modules/hyprland.nix
    ./modules/hyprlock.nix
    ./modules/kitty.nix
    ./modules/lf.nix
    ./modules/mpv.nix
    ./modules/networkmanager-dmenu.nix
    ./modules/nix-index.nix
    ./modules/sioyek.nix
    ./modules/starship.nix
    ./modules/udiskie.nix
    ./modules/waybar
    ./modules/wofi
  ];

  # Colorscheme
  colorScheme =
    let
      scheme = colorSchemes.catppuccin-mocha;
      hashedColors = lib.mapAttrs (_: color: "#${color}") scheme.palette;
      hyprColors = lib.mapAttrs (_: color: "rgb(${color})") scheme.palette;
    in
    scheme
    // {
      inherit hashedColors;
      inherit hyprColors;
    };

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
