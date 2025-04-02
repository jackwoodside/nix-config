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
    ./modules/direnv.nix
    ./modules/dunst.nix
    ./modules/eww
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
    ./modules/mpv.nix
    ./modules/neovim.nix
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
    krita
    texlive.combined.scheme-full
  ];

  # Mime applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "sioyek.desktop" ];
    };
  };

  # Customised desktop entries
  xdg.desktopEntries = {
    # Jellyfin
    "com.github.iwalton3.jellyfin-media-player" = {
      name = "Jellyfin";
      exec = "jellyfinmediaplayer --disable-gpu";
    };
    # Krita
    "org.kde.krita" = {
      name = "Krita";
      exec = "krita --nosplash";
    };
  };
}
