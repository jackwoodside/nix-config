{ modulesPath, pkgs, ... }: {
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
  environment.systemPackages = [ pkgs.git ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
