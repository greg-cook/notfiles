{
  description = "My system config with nix-darwin and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
      mac-app-util,
      nix-vscode-extensions,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.git
            pkgs.nixd
            pkgs.nixfmt-rfc-style
            pkgs.vim
          ];
          system.defaults = {
            ActivityMonitor.ShowCategory = 100;
            NSGlobalDomain = {
              AppleShowAllFiles = true;
              AppleInterfaceStyleSwitchesAutomatically = true;
              ApplePressAndHoldEnabled = false;
              AppleShowAllExtensions = true;
              AppleShowScrollBars = "WhenScrolling";
              NSAutomaticCapitalizationEnabled = false;
              NSAutomaticInlinePredictionEnabled = false;
              NSAutomaticDashSubstitutionEnabled = false;
              NSAutomaticPeriodSubstitutionEnabled = false;
              NSAutomaticQuoteSubstitutionEnabled = false;
              NSAutomaticSpellingCorrectionEnabled = false;
              NSAutomaticWindowAnimationsEnabled = false;
              NSNavPanelExpandedStateForSaveMode = true;
              NSNavPanelExpandedStateForSaveMode2 = true;
              InitialKeyRepeat = 15;
              KeyRepeat = 2;
              PMPrintingExpandedStateForPrint = true;
              PMPrintingExpandedStateForPrint2 = true;
            };
            CustomUserPreferences = {
              "NSGlobalDomain" = {
                "NSStatusItemSpacing" = 6;
                "NSStatusItemSelectionPadding" = 6;
              };
              "com.knollsoft.Rectangle" = {
                "allowAnyShortcut" = 1;
                "alternateDefaultShortcuts" = 1;
                "launchOnLogin" = 1;
                "subsequentExecutionMode" = 0;
                "selectedCycleSizes" = 31;
              };
            };
            SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
            WindowManager.GloballyEnabled = false;
            menuExtraClock = {
              Show24Hour = true;
              ShowDayOfMonth = true;
              ShowDayOfWeek = true;
            };
            controlcenter = {
              AirDrop = false;
              BatteryShowPercentage = false;
              Bluetooth = false;
              Display = false;
              Sound = false;
            };
            finder = {
              _FXSortFoldersFirst = true;
              AppleShowAllExtensions = true;
              AppleShowAllFiles = true;
              FXDefaultSearchScope = "SCcf";
              FXPreferredViewStyle = "clmv";
              NewWindowTarget = "Home";
              ShowPathbar = true;
              ShowStatusBar = true;
            };
            loginwindow.GuestEnabled = false;
            trackpad = {
              ActuationStrength = 0;
              FirstClickThreshold = 0;
              SecondClickThreshold = 1;
            };
            dock = {
              autohide = true;
              autohide-delay = 0.0;
              autohide-time-modifier = 0.0;
              minimize-to-application = true;
              showhidden = true;
              show-recents = false;
              static-only = true;
              tilesize = 48;
            };
          };
          system.keyboard = {
            enableKeyMapping = true;
            remapCapsLockToControl = true;
          };
          networking = {
            computerName = "mba";
            hostName = "mba";
          };
          homebrew = {
            enable = true;
            onActivation.cleanup = "uninstall";
            taps = [ ];
            brews = [
              "batt"
            ];
            casks = [
              "1Password" # Must be install in /Applications, so cannot use nixpkgs
              "logi-options+"
              "Stremio"
              "teamviewer"
            ];
            masApps = {
              "1Password for Safari" = 1569813296;
              "Microsoft Word" = 462054704;
              "Microsoft Excel" = 462058435;
              "Parcel" = 639968404;
            };
          };

          fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.config.allowBroken = true;
          # Declare the user that will be running `nix-darwin`.
          users.users.gc = {
            name = "gc";
            home = "/Users/gc";
          };
          security.pam.services.sudo_local.touchIdAuth = true;
          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [
            nix-vscode-extensions.overlays.default
          ];
        };
      homeconfig =
        { pkgs, ... }:
        {
          home = {
            packages = with pkgs; [
              _1password-cli
              alacritty
              asdf-vm
              colima
              docker-buildx
              docker-client
              docker-compose
              fd
              fzf
              gh
              google-chrome
              ice-bar
              iterm2
              lazygit
              luarocks
              rectangle
              ripgrep
              stats
              tart
              windsurf
              zoom-us
            ];
            stateVersion = "25.05";
            file = {
              ".config/nvim" = {
                source = ./config/nvim;
                recursive = true;
              };
              "Library/Application\ Support/iTerm2/DynamicProfiles/mine.json" = {
                source = ./config/iterm2/mine.json;
              };
            };
            shell.enableZshIntegration = true;
          };
          editorconfig = {
            enable = true;
            settings = {
              "*" = {
                charset = "utf-8";
                end_of_line = "lf";
                trim_trailing_whitespace = true;
                insert_final_newline = true;
                max_line_width = 78;
                indent_style = "space";
                indent_size = 4;
              };
            };
          };
          programs = {
            direnv.enable = true;
            git = {
              enable = true;
              extraConfig = {
                gpg = {
                  format = "ssh";
                  ssh = {
                    program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
                  };
                };
                commit = {
                  gpgsign = true;
                };
              };
              diff-so-fancy = {
                enable = true;
                changeHunkIndicators = true;
                markEmptyLines = true;
              };
              signing = {
                key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK+VGSqIP96us62MMoKVsyAXOA/LVFnWOTJWjLqAU3Le";
              };
              userEmail = "5386965+greg-cook@users.noreply.github.com";
              userName = "Greg Cook";
            };
            home-manager.enable = true;
            neovim = {
              enable = true;
              coc.enable = true;
              defaultEditor = true;
              viAlias = true;
              vimAlias = true;
              vimdiffAlias = true;
            };
            ssh = {
              enable = true;
              extraConfig = "IdentityAgent \"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"\n";
            };
            vscode = {
              enable = true;
              profiles = {
                default = {
                  userSettings = {
                    "editor" = {
                      "fontFamily" = "JetBrainsMono Nerd Font Mono";
                      "fontLigatures" = true;
                      "fontSize" = 13;
                      "formatOnSave" = true;
                      "scrollBeyondLastLine" = false;
                    };
                    "nix" = {
                      "enableLanguageServer" = true;
                      "serverPath" = "nixd";
                    };
                    "telemetry.telemetryLevel" = "off";
                    "terminal" = {
                      "integrated" = {
                        "copyOnSelection" = true;
                        "fontLigatures.enabled" = true;
                      };
                    };
                    "window.autoDetectColorScheme" = true;
                    "workbench" = {
                      "colorTheme" = "Tokyo Night";
                      "preferredDarkColorTheme" = "Tokyo Night";
                      "preferredLightColorTheme" = "Tokyo Night Light";
                      "startupEditor" = "none";
                      "welcomePage.walkthroughs.openOnInstall" = false;
                    };
                  };
                  keybindings = [
                    # See https://code.visualstudio.com/docs/getstarted/keybindings#_advanced-customization
                    {
                      key = "shift+cmd+j";
                      command = "workbench.action.focusActiveEditorGroup";
                      when = "terminalFocus";
                    }
                  ];
                  extensions = with pkgs.vscode-marketplace; [
                    dnicolson.binary-plist
                    enkia.tokyo-night
                    jnoortheen.nix-ide
                    ms-python.python
                    shopify.ruby-extensions-pack
                  ];
                };
              };
            };
            zsh = {
              enable = true;
              oh-my-zsh = {
                enable = true;
                plugins = [
                  # "asdf"
                  "docker"
                  "git"
                  "kubectl"
                ];
                theme = "robbyrussell";
              };
              initExtra = ''
                . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
              '';
              shellAliases = {
                lg = "lazygit";
                switch = "darwin-rebuild switch --flake ~/code/greg-cook/notfiles";
                watch = "watch ";
              };
              autocd = true;
              dotDir = ".config/zsh";
              autosuggestion.enable = true;
              syntaxHighlighting.enable = true;
              historySubstringSearch.enable = true;
              enableCompletion = true;
              history = {
                "append" = true;
                "size" = 5000;
                "ignoreAllDups" = true;
                "ignoreSpace" = true;
                "share" = true;
              };
            };
          };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#mba
      darwinConfigurations."mba" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              users.gc = homeconfig;
              sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
            };
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "gc";
            };
          }
        ];
      };
    };
}
