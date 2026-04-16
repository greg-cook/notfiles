{
  config,
  hostConfig,
  ...
}:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "aws"
        "docker"
        "git"
        "kubectl"
        "opentofu"
        "terraform"
      ];
    };
    shellAliases = {
      cat = "bat";
      ide = "zed .";
      switch = "sudo darwin-rebuild switch --flake ~/code/personal/notfiles#${hostConfig.key}";
      watch = "watch ";
    };
    autocd = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
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
    sessionVariables = hostConfig.sessionVariables;
    initContent = hostConfig.extraZshInit;
  };
}
