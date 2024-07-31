{ pkgs, ... }:

{
  system.stateVersion = "24.05";

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    timeout = 3;
  };
  boot.supportedFilesystems.ntfs = true;

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Graphics
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };

  # Networking
  networking.networkmanager.enable = true;

  # Packages
  environment.pathsToLink = [ "/share/fish" ];
  programs = {
    fish.enable = true;
  };
  fonts.packages = with pkgs; [ jetbrains-mono ];
  services.udisks2.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Timezone
  time.timeZone = "Australia/Sydney";

  # Users
  users.mutableUsers = false;
  users.users.jack = {
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"
    ];
    home = "/home/jack";
    isNormalUser = true;
    shell = pkgs.fish;
    password = "test";
  };
}
