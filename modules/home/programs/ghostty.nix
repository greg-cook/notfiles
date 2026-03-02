{ ... }:

{
  programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      theme = "Nord";
      copy-on-select = "clipboard";
    };
  };
}
