{
  config,
  hostConfig,
  ...
}:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "basher"
      "catppuccin"
      "catppuccin-icons"
      "docker-compose"
      "dockerfile"
      "git-firefly"
      "html"
      "ini"
      "lua"
      "make"
      "nix"
      "php"
      "python-requirements"
      "rainbow-csv"
      "ruby"
      "sql"
      "terraform"
      "toml"
    ];
    package = null;
    userSettings = {
      close_on_file_delete = true;
      ensure_final_newline_on_save = true;
      scroll_beyond_last_line = "off";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      terminal = {
        copy-on-select = true;
      };
    };
  };
}
