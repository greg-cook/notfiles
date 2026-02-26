{ hostConfig, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    taps = [ ];
    brews = [
      # Install deps for ruby-build as it doesn't work with nixpkgs
      "autoconf"
      "batt"
      "gmp"
      "libyaml"
      "openssl@3"
      "readline"
    ]
    ++ hostConfig.extraBrews;
    casks = [
      "ghostty@tip"
      "jordanbaird-ice"
      "logi-options+"
      "obsidian"
      "orbstack"
      "rectangle"
      "stats"
      "zed@preview"
      "zoom"
    ]
    ++ hostConfig.extraCasks;
    masApps = hostConfig.extraMasApps;
  };
}
