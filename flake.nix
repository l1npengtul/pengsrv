{
  description = "peng server flake";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
    agenix.url = "github:ryantm/agenix";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    vhs-decode-nur-packages.url = "github:JuniorIsAJitterbug/nur-packages";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    disko,
    impermanence,
    agenix,
    alejandra,
    vhs-decode-nur-packages,
    nix-minecraft,
    ...
  } @ inputs: let
    username = "pengserver";
    system = "x86_64-linux";
    commonArgs = {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs = import nixpkgs commonArgs;
    pkgs-unstable = import nixpkgs commonArgs;
    lib = nixpkgs.lib;
  in {
    inherit commonArgs;

    nixosConfigurations = {
      zo = lib.nixosSystem {
        inherit system pkgs;
        specialArgs = {
          inherit inputs pkgs-unstable;
        };

        modules = [
          nix-minecraft.nixosModules.minecraft-servers
          disko.nixosModules.disko
          impermanence.nixosModules.impermanence

          ./configuration.nix
          ./hosts/zo
        ];
      };
    };
  };
}
