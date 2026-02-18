{ ... }:

{
  programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      theme = "Catppuccin Mocha";
      copy-on-select = "clipboard";
    };
  };
}
