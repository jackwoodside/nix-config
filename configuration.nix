{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./persistence-home
    ./persistence-nixos.nix
  ];

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    timeout = 3;
  };
  boot.supportedFilesystems = [ "ntfs" ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Graphics
  hardware.opengl = {
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager = {
      autoLogin = {
        enable = true;
        user = "USERNAME";
      };
      lightdm = {
        enable = true;
        autoLogin.timeout = 0;
        greeter.enable = false;
      };
    };
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };

  # Networking
  networking = {
    hostName = "HOSTNAME";
    networkmanager.enable = true;
  };
  services.globalprotect.enable = true;

  # Packages
  environment = {
    systemPackages = with pkgs; [
      git
      globalprotect-openconnect
      wget
      vim
    ];
    pathsToLink = [ "/share/fish" ];
  };
  fonts.fonts = with pkgs; [ roboto-mono ];
  nixpkgs.config.allowUnfree = true;
  programs = {
    dconf.enable = true;
    fish.enable = true;
  };
  services.udisks2.enable = true;

  # Timezone
  time.timeZone = "TIMEZONE";

  # Users
  users = {
    mutableUsers = false;
    users.USERNAME = {
      extraGroups = [ "networkmanager" "video" "wheel" ];
      initialHashedPassword = "USERPASS";
      isNormalUser = true;
      shell = pkgs.fish;
    };
    users.root.initialHashedPassword = "ROOTPASS";
  };

  system.stateVersion = "22.11";
}
