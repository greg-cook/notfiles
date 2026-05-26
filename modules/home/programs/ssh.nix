{ lib, hostConfig, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        IdentityFile = "~/.ssh/github_id_ed25519";
      };
    }
    // lib.optionalAttrs (hostConfig.sshKey != null) {
      "bitbucket.org" = {
        IdentityFile = "~/.ssh/${hostConfig.sshKey}";
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
