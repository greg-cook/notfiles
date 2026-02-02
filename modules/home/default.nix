{ hostConfig, ... }:

{
  imports = [
    ./packages.nix
    ./files.nix
    ./editorconfig.nix
    ./programs
  ];

  _module.args = { inherit hostConfig; };

  home = {
    homeDirectory = "/Users/${hostConfig.username}";
    stateVersion = "25.05";
    shell.enableZshIntegration = true;
    sessionPath = [ "$HOME/.local/bin" ] ++ hostConfig.extraSessionPath;
  };
  xdg = {
    configHome = "/Users/${hostConfig.username}/.config";
    dataHome = "/Users/${hostConfig.username}/.data";
    cacheHome = "/Users/${hostConfig.username}/.cache";
  };
}
