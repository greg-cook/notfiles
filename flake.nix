{
  description = "My system config with nix-darwin and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # PR #486268: fix ssm-session-manager-plugin build
    nixpkgs-ssm-fix.url = "github:NixOS/nixpkgs/pull/486268/head";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-ssm-fix,
      nix-darwin,
      nix-homebrew,
      home-manager,
    }:
    let
      hosts = import ./hosts.nix;

      # Overlay to pull packages from PR branches until they're merged
      prOverlay = final: prev: {
        ssm-session-manager-plugin =
          (import nixpkgs-ssm-fix { system = prev.stdenv.hostPlatform.system; }).ssm-session-manager-plugin;
      };

      # Helper function to create a darwin configuration for a host
      mkDarwinConfig =
        hostKey: hostAttrs:
        let
          hostConfig = hostAttrs // {
            key = hostKey;
          };
        in
        nix-darwin.lib.darwinSystem {
          specialArgs = { inherit hostConfig; };
          modules = [
            # Apply overlays for PR fixes
            { nixpkgs.overlays = [ prOverlay ]; }

            # Darwin system configuration
            (
              {
                pkgs,
                lib,
                config,
                hostConfig,
                ...
              }:
              import ./modules/darwin/default.nix {
                inherit
                  pkgs
                  lib
                  config
                  hostConfig
                  ;
              }
            )

            # Home-manager configuration
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                backupFileExtension = "nixbackup";
                useGlobalPkgs = true;
                useUserPackages = true;
                verbose = true;
                extraSpecialArgs = { inherit hostConfig; };
                users.${hostConfig.user} = (
                  {
                    pkgs,
                    config,
                    lib,
                    hostConfig,
                    ...
                  }:
                  import ./modules/home/default.nix {
                    inherit
                      pkgs
                      config
                      lib
                      hostConfig
                      ;
                  }
                );
              };
            }

            # Homebrew configuration
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                extraEnv = {
                  HOMEBREW_NO_ANALYTICS = "1";
                };
                user = hostConfig.username;
              };
            }
          ];
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild switch --flake .#work
      darwinConfigurations = builtins.mapAttrs mkDarwinConfig hosts;
    };
}
