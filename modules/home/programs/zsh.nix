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
        "terraform"
      ];
      # theme = "robbyrussell";
    };
    shellAliases = {
      bb = "docker run -it --rm --mount type=bind,source=\"$HOME/tmp/.bitbucket-rest-cli-config.json\",target=/root/.bitbucket-rest-cli-config.json --mount type=bind,source=\"$(pwd)\",target=/workdir,readonly ghcr.io/bb-cli/bb-cli";
      cat = "bat";
      ide = "zed .";
      lg = "lazygit";
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
    sessionVariables = {
      AWS_PAGER = "";
      BB_REPO_PATH = "/Users/${hostConfig.username}/projects";
      PATH = "$PATH:/Users/${hostConfig.username}/.local/bin:$BB_REPO_PATH/dev-scripts";
    };
  };
}
