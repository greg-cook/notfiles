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
      "gmp"
      "libyaml"
      "openssl@3"
      "readline"
    ]
    ++ hostConfig.extraBrews;
    casks = [
      "docker-desktop"
      "ghostty@tip"
      "jordanbaird-ice"
      "logi-options+"
      "obsidian"
      "rectangle"
      "stats"
      "zed@preview"
      "zoom"
    ]
    ++ hostConfig.extraCasks;
    masApps = hostConfig.extraMasApps;
  };
}
