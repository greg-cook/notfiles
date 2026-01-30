{ hostConfig, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
      };
      "bitbucket" = {
        host = "bitbucket.org";
        identityFile = "~/.ssh/${hostConfig.sshKey}";
      };
      "github" = {
        host = "github.com";
        identityFile = "~/.ssh/github_id_ed25519";
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
