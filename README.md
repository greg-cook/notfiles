# notfiles

Declarative macOS configuration using nix-darwin and home-manager.

## Setup

1. Install Xcode command line tools

```sh
xcode-select --install
```

2. Install Nix with [nix-installer](https://github.com/NixOS/nix-installer)

```sh
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install
```

3. Bootstrap the system (replace `personal` with your host key from `hosts.nix`)

```sh
nix run nix-darwin -- switch --flake github:greg-cook/notfiles#personal
```

4. Rebuild after changes

```sh
switch
```

## Troubleshooting

### Logi Options+ stuck on permissions step

If the app won't proceed past the permissions step, manually add the following path to **System Settings > Privacy & Security > Input Monitoring**:

```
/Library/Application Support/Logitech.localized/LogiOptionsPlus/Logi Options+.app
```

Then reopen the application from `/Applications`.

## Adding a new machine

Add an entry to `hosts.nix` with the required fields, then bootstrap as above.
