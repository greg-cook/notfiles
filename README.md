# notfiles

Declarative macOS configuration using nix-darwin and home-manager.

## Setup

1. Install Xcode command line tools
```sh
xcode-select --install
```

2. Install Nix with the [Determinate Systems installer](https://github.com/DeterminateSystems/nix-installer)
```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

3. Bootstrap the system (replace `personal` with your host key from `hosts.nix`)
```sh
nix run nix-darwin -- switch --flake github:greg-cook/notfiles#personal
```

4. Rebuild after changes
```sh
switch
```

## Adding a new machine

Add an entry to `hosts.nix` with the required fields, then bootstrap as above.
