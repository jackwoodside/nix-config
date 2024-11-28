{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      disko,
      home-manager,
      nix-colors,
      sops-nix,
      ...
    }:
    {
      nixosConfigurations =
        let
          modules = [
            { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }

            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops

            # For including self.images
            {
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }

            {
              home-manager.sharedModules = [
                nix-colors.homeManagerModules.default
                (
                  { lib, ... }:
                  {
                    options.colorScheme = {
                      hashedColors = with lib; mkOption { type = types.attrsOf types.str; };
                      hyprColors = with lib; mkOption { type = types.attrsOf types.str; };
                    };
                  }
                )
                { _module.args.colorSchemes = nix-colors.colorSchemes; }
              ];
            }

            ./systems
          ];
        in
        {
          # ISO
          iso = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ ./systems/iso.nix ];
          };

          # Desktop (Home)
          desktop-home = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = modules ++ [ ./systems/desktop-home ];
          };

          # Desktop (Work)
          desktop-work = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = modules ++ [ ./systems/desktop-work ];
          };

          # Laptop
          laptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = modules ++ [ ./systems/laptop ];
          };
        };
    };
}
