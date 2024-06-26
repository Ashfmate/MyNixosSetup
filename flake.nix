{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
  {
    devShells.${system}.default = (import ./shell.nix { inherit pkgs; });
    nixosConfigurations = {
      myNixos = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs system; };
	modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      myNixos = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	modules = [ ./home.nix ];
      };
    };
  };
}
