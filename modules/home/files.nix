{ ... }:

{
  home.file = {
    ".config/zed/settings.json" = {
      source = ../../config/zed/settings.json;
    };
    ".config/nvim" = {
      source = ../../config/nvim;
      recursive = true;
    };
    ".hushlogin" = {
      text = ''null '';
      executable = false;
    };
  };
}
