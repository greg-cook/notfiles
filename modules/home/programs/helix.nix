{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = pkgs.evil-helix;
    settings = {
      theme = "nord";
    };
  };
}
