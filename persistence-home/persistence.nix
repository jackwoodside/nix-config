{ ... }:
{
  home.persistence."/nix/persist/home/USERNAME" = {
    directories = [
      # Firefox
      ".mozilla/firefox"

      # Spotify
      ".cache/spotify/Storage"
      ".config/spotify"

      # Steam
      ".local/share/Steam"

      # Misc.
      "Documents"
      "Downloads"
      "Pictures"
      "Videos"
      ".ssh"
    ];
    files = [
      # Bitwarden
      ".config/Bitwarden\ CLI/data.json"

      # Fish
      ".local/share/fish/fish_history"
    ];
  };
}
