{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, ... }@inputs:
    {
      nixosConfigurations = {
        desktop-home = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
            disko.nixosModules.disko
            ./desktop-home/configuration.nix
          ];
        };
      };
    };
}
