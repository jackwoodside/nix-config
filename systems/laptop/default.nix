{ ... }:

{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  # Audio
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  # Networking
  networking.hostName = "callisto";

  # Users
  home-manager.users.jack = import ../../programs/laptop;
}
