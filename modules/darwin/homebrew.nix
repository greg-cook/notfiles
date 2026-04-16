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
      "ghostty"
      "karabiner-elements"
      "logi-options+"
      "obsidian"
      "orbstack"
      "rectangle"
      "stats"
      "thaw"
      "zed"
      "zoom"
    ]
    ++ hostConfig.extraCasks;
    masApps = hostConfig.extraMasApps;
  };
}
