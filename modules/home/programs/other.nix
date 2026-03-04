{ ... }:

{
  programs = {
    bash.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Nord";
      };
    };
    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
      settings = {
        changeHunkIndicators = true;
        markEmptyLines = true;
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      icons = "auto";
    };
    home-manager.enable = true;
    lazygit.enable = true;
    mr.enable = true;
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
