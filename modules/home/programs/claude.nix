{ lib, hostConfig, ... }:

{
  programs.claude-code = {
    enable = true;
    settings = {
      # Prevent claude adding itself to commits/prs
      attribution = {
        commit = "";
        pr = "";
      };
    };
  };
}
