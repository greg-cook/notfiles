{ hostConfig, ... }:

{
  imports = [
    ./packages.nix
    ./system-defaults.nix
    ./networking.nix
    ./homebrew.nix
    ./users.nix
    ./nix.nix
  ];

  _module.args = { inherit hostConfig; };
}
