{ ... }:

{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  # Graphics
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # Networking
  networking.hostName = "europa";

  # Radio
  hardware.rtl-sdr.enable = true;

  # Users
  home-manager.users.jack = import ../../programs/desktop-home;
}
