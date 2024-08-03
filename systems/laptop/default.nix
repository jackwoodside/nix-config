{ pkgs, ... }:

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
  services.globalprotect.enable = true;
  services.tailscale.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [ globalprotect-openconnect ];

  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      gutenprintBin
    ];
  };

  # Users
  # home-manager.users.jack = import ../../programs/laptop;
}
