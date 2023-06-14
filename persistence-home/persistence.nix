{ ... }:
{
  home.persistence."/nix/persist/home/USERNAME" = {
    directories = [
      ".local/share/Steam"
      ".ssh"
      "Documents"
      "Downloads"
      "Pictures"
      "Videos"
    ];
    files = [ ".local/share/fish/fish_history" ];
  };
}
