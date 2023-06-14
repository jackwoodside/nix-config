{ ... }:
{
  home.persistence."/nix/persist/home/USERNAME" = {
    directories = [
      # Bitwarden
      ".config/Bitwarden\ CLI"

      # Firefox
      ".mozilla/firefox"

      # Spotify
      ".cache/spotify/Storage"
      ".config/spotify"

      # ssh
      ".ssh"

      # Steam
      ".local/share/Steam"

      # Misc.
      "Documents"
      "Downloads"
      "Pictures"
      "Videos"
    ];
    files = [ ".local/share/fish/fish_history" ];
  };
}
