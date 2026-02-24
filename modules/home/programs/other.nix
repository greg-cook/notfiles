{ pkgs, ... }:

{
  programs = {
    awscli = {
      enable = true;
    };
    bash.enable = true;
    bat = {
      enable = true;
      themes = {
        catppuccin = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat";
            rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
            sha256 = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
          };
          file = "themes/Catppuccin Mocha.tmTheme";
        };
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
