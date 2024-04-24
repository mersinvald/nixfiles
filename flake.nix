{
  description = "Mike's Nix Stuff";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-secrets = {
      url = "github:sudosubin/home-manager-secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    darwin,
    nixos-wsl,
    flake-utils,
    home-manager,
    home-manager-secrets,
    nixpkgs,
    ... } @ inputs: {
    darwinConfigurations = {
      "mbp14" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # setup darwin core options
          ./darwin/darwin.nix

          # setup system packages and defaults
          ./darwin/system.nix

          # setup home-manager
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              # include the home-manager module
              users.mersinvald = { config, pkgs, ... }: {
                imports = [
                  home-manager-secrets.homeManagerModules.home-manager-secrets
                  ./home/home.nix
                ];
              };
            };

            users.users.mersinvald.home = "/Users/mersinvald";
          }
        ];

        specialArgs = { inherit inputs; };
      };
    };
  };
}
