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
      "betterdisplay"
      "ghostty@tip"
      "jordanbaird-ice"
      "karabiner-elements"
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
