{ ... }:

{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  # Networking
  networking.hostName = "io";

  # SSH
  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
  };

  # Users
  home-manager.users.jack = import ../../programs/desktop-work;
  users.users.jack.extraGroups = [ "libvirtd" ];

  # Virtualisation
  virtualisation.libvirtd.enable = true;
}
