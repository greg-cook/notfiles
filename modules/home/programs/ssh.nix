{ lib, hostConfig, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "github" = {
        host = "github.com";
        identityFile = "~/.ssh/github_id_ed25519";
      };
    }
    // lib.optionalAttrs (hostConfig.sshKey != null) {
      "bitbucket" = {
        host = "bitbucket.org";
        identityFile = "~/.ssh/${hostConfig.sshKey}";
      };
    };
    extraConfig = ''
      UseKeychain yes
      SetEnv TERM=xterm-256color
      ${hostConfig.sshExtraConfig}
    '';
    includes = [
      "~/.ssh/config.d/*"
    ];
  };
}
