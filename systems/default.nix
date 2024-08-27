{ lib, pkgs, ... }:

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
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      timeout = 3;
    };
    kernelParams = [
      "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
      "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
      "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"
    ];
    supportedFilesystems.ntfs = true;
  };

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
  services.greetd = {
    enable = true;
    settings.default_session.command = "${lib.getExe pkgs.greetd.tuigreet} --cmd Hyprland";
  };

  # Networking
  networking.networkmanager.enable = true;
  services.tailscale.enable = true;

  # Packages
  environment.pathsToLink = [ "/share/fish" ];
  programs = {
    fish.enable = true;
    xwayland.enable = true;
  };
  programs.dconf.enable = true; # For GTK themes
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
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jack = import ../programs;
  };
}
