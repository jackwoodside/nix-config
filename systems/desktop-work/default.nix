{ ... }:

{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  # Networking
  networking.hostName = "io";

  # Users
  home-manager.users.jack = import ../../programs/desktop-work;
}
