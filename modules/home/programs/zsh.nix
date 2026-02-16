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
        "docker"
        "git"
        "kubectl"
        "terraform"
      ];
    };
    shellAliases = {
      bb = "docker run -it --rm --mount type=bind,source=\"$HOME/tmp/.bitbucket-rest-cli-config.json\",target=/root/.bitbucket-rest-cli-config.json --mount type=bind,source=\"$(pwd)\",target=/workdir,readonly ghcr.io/bb-cli/bb-cli";
      cat = "bat";
      ide = "zed-preview .";
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
