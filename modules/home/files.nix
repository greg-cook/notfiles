{ ... }:

{
  home.file = {
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
