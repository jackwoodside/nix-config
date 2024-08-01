{ ... }:

{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  # Graphics
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  # Networking
  networking.hostName = "europa";

  # Users
  home-manager.users.jack = import ../../programs/desktop-home;
}
