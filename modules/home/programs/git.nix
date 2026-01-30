{ lib, hostConfig, ... }:

{
  programs.git = {
    enable = true;
    ignores = [
      ".vscode"
    ];
    includes = hostConfig.gitIncludes;
    settings = {
      user = {
        email = hostConfig.email;
        name = hostConfig.name;
      };
      gpg = {
        format = "ssh";
        ssh = lib.mkMerge [
          (lib.mkIf (hostConfig.gitSigningProgram != null) {
            program = hostConfig.gitSigningProgram;
          })
          (lib.mkIf (hostConfig.gitSigningProgram == null) {
            allowedSignersFile = "/Users/${hostConfig.username}/.ssh/allowed_signers";
          })
        ];
      };
      commit = {
        gpgsign = true;
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
    signing = {
      key = hostConfig.gitSigningKey;
    };
  };
}
