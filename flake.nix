{
  inputs =
    let
      version = "24.05";
    in
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-${version}";
      disko = {
        url = "github:nix-community/disko";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      home-manager = {
        url = "github:nix-community/home-manager/release-${version}";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      sops-nix = {
        url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      sops-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # ISO
        iso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./systems/iso.nix ];
        };

        # Desktop (Home)
        desktop-home = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            ./systems/common
            ./systems/desktop-home
          ];
        };
      };
    };
}
