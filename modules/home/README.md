# Home Manager Configuration

This directory contains the modular home-manager configuration for the user environment.

## Structure

```
modules/home/
├── default.nix          # Main entry point that imports all modules
├── packages.nix         # Package installations
├── files.nix           # Configuration files and dotfiles
├── editorconfig.nix    # Editor configuration
├── programs/           # Program-specific configurations
│   ├── default.nix     # Imports all program modules
│   ├── git.nix         # Git configuration
│   ├── neovim.nix      # Neovim configuration
│   ├── ssh.nix         # SSH configuration
│   ├── vscode.nix      # VS Code configuration
│   ├── zsh.nix         # Zsh configuration
│   └── other.nix       # Other program configurations
└── README.md           # This file
```

## Modules

### `packages.nix`
Contains all the packages to be installed via home-manager. This includes:
- Development tools (cargo, luarocks, etc.)
- CLI utilities (fd, fzf, ripgrep, etc.)
- Language managers (asdf-vm)

Note: GUI applications are managed through Homebrew via `nix-homebrew` in the Darwin configuration, but their configuration files are still managed here.

### `files.nix`
Manages configuration files and dotfiles:
- `.asdfrc` for asdf version manager
- Configuration directories (alacritty, nvim, zsh)
- System files (`.hushlogin`)

### `editorconfig.nix`
Global editor configuration for consistent coding standards:
- UTF-8 encoding
- LF line endings
- 4-space indentation
- 78-character line width

### `programs/`
Individual program configurations organized by functionality:

#### `git.nix`
Git configuration with:
- SSH-based GPG signing
- Diff-so-fancy for better diffs
- User information and default branch

#### `neovim.nix`
Neovim configuration with:
- Default editor settings
- Aliases for vi/vim commands

#### `ssh.nix`
SSH configuration with:
- Keychain integration
- Bitbucket host configuration
- Include directory for additional configs

#### `vscode.nix`
VS Code configuration with:
- Tokyo Night theme
- Nerd Font integration
- Extensions for various languages
- Custom keybindings

#### `zsh.nix`
Zsh configuration with:
- Oh My Zsh integration
- Powerlevel10k theme
- Custom keybindings for natural text editing
- Shell aliases and environment variables
- History and completion settings

#### `other.nix`
Miscellaneous program configurations:
- AWS CLI
- Bash
- Bat (better cat)
- Direnv
- Eza (better ls)
- Home Manager
- Lazygit
- Z-lua (better cd)

## Benefits of This Structure

1. **Modularity**: Each concern is separated into its own file
2. **Maintainability**: Easier to find and modify specific configurations
3. **Reusability**: Individual modules can be easily reused or conditionally included
4. **Readability**: Smaller files are easier to understand and navigate
5. **Version Control**: Changes to specific areas are more clearly tracked

## Adding New Configurations

To add a new program configuration:

1. Create a new file in `programs/` (e.g., `programs/newtool.nix`)
2. Add the import to `programs/default.nix`
3. Follow the existing pattern for the configuration structure

To add new packages:

1. Edit `packages.nix` and add the package to the list
2. If the package requires configuration, consider creating a separate program module

To add new files:

1. Edit `files.nix` and add the file configuration
2. For complex file structures, consider creating a separate module 