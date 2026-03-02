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
      "batt"
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
