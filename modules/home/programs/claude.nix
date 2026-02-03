{ lib, hostConfig, ... }:

{
  programs.claude-code = {
    enable = true;
    settings = {
      includeCoAuthoredBy = false;
    };
  };
}
