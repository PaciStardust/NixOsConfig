{
  description = "Paci NixOS :3";

  inputs =
  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
  {
    self,
    nixpkgs,
    lanzaboote,
    home-manager,
    ...
  } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.sirius-nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager
        ./devices/sirius-nixos/configuration.nix
      ];
    };
  };
}