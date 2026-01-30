{ ... }:

{
  programs.ghostty = {
    enable = true;
    package = null;
    settings = {
      theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";
      copy-on-select = "clipboard";
      # Disabled for now
      # custom-shader = "~/.config/ghostty/shaders/shader.glsl";
    };
  };
}
