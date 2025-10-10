{
  description = "A simmple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    nvix = {
      url = "github:niksingh710/nvix";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty/v1.2.2";
    };
  };

  outputs = inputs@{ nixpkgs, nixvim, nvix, ghostty, home-manager, ... }: {
    nixosConfigurations = {
      "zzio-vm-arm64" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./machines/vm-arm64/default.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit nixpkgs;
            };
            home-manager.users.zzio = import ./home.nix;
          }
        ];
      };
      "zzio-amd64" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/amd64/default.nix
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit nixpkgs;
            };
            home-manager.users.zzio = import ./home.nix;
          }
        ];       
      };
    };
  };
}
