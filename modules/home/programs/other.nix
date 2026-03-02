{ pkgs, ... }:

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
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
    };
    home-manager.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;
    mr.enable = true;
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
