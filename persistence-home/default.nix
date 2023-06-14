{ ... }:

let
  home-manager = builtins.fetchTarball
    {
      url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    };
  impermanence = builtins.fetchTarball {
    url =
      "https://github.com/nix-community/impermanence/archive/master.tar.gz";
  };
in
{
  # Import the home-manager module.
  imports = [ "${home-manager}/nixos" ];
  home-manager.useGlobalPkgs = true;
  home-manager.users.USERNAME = { pkgs, ... }: {
    imports = [
      "${impermanence}/home-manager.nix"
      ./persistence.nix
      # ./programs
    ];
    programs.home-manager.enable = true;

    # User info
    home.username = "USERNAME";
    home.homeDirectory = "/home/USERNAME";

  };
}
