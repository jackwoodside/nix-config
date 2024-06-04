{ pkgs, ... }:

{
  system.stateVersion = "24.05";

  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

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
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Graphics
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  # Networking
  networking = {
    hostName = "europa";
    networkmanager.enable = true;
  };
  services.globalprotect.enable = true;

  # Packages
  environment = {
    systemPackages = with pkgs; [
      git
      helix
      nil
      nixpkgs-fmt
      wget
      vim
    ];
    pathsToLink = [ "/share/fish" ];
  };
  programs = {
    dconf.enable = true;
    fish.enable = true;
  };
  fonts.packages = with pkgs; [ jetbrains-mono ];
  services.udisks2.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Timezone
  time.timeZone = "Australia/Sydney";

  # Users
  users.users.jack =
    {
      extraGroups = [ "networkmanager" "video" "wheel" ];
      home = "/home/jack";
      isNormalUser = true;
      shell = pkgs.fish;
    };


  # X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    windowManager.bspwm.enable = true;
  };
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "jack";
    };
    lightdm = {
      enable = true;
      autoLogin.timeout = 0;
      greeter.enable = false;
    };
  };

}
