{
  description = "dotfiles-nix-core";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";

    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.2605.*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nono = {
      url = "github:nolabs-ai/nono?ref=v0.79.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pi = {
      url = "github:earendil-works/pi/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix4vscode,
      pi,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      mkHome =
        {
          system,
          module,
          extraSpecialArgs ? { },
          ...
        }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              nix4vscode.overlays.default
            ];
          };
          modules = [
            module
            {
              programs.home-manager.enable = true;
            }
          ];
          extraSpecialArgs = {
            inputs = inputs // {
              dotfiles = self;
            };
            pkgsUnstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
            hmDotfiles = name: "${self}/modules/home-manager/${name}";
          }
          // extraSpecialArgs;
        };

      mkHomeConfigurations =
        hostsDir:
        builtins.listToAttrs (
          map (
            hostName:
            let
              hostDef = import (hostsDir + "/${hostName}");
            in
            {
              name = "${hostDef.username}@${hostName}";
              value = mkHome hostDef;
            }
          ) (builtins.attrNames (builtins.readDir hostsDir))
        );
    in
    {
      lib = {
        inherit mkHome mkHomeConfigurations;
      };

      formatter = nixpkgs.lib.genAttrs supportedSystems (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );
    };
}
