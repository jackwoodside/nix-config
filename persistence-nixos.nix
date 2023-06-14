{ ... }:

let
  impermanence = builtins.fetchTarball {
    url =
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
  };
in
{
  imports = [ "${impermanence}/nixos.nix" ];

  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/log"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}
