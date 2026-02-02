# Machine-specific configurations
# Add a new entry here when setting up a new machine
let
  mkHost = { username, ... }@args: args // { homeDir = "/Users/${username}"; };
in
{
  # Work laptop
  work = mkHost {
    hostname = "MVFLP01840";
    username = "greg.cook"; # macOS username (for homebrew, paths)
    user = "gregcook"; # home-manager user (no dots allowed)
    name = "Greg Cook";
    email = "greg.cook@mvfglobal.com";
    sshKey = "MVFLP01840"; # SSH key name in ~/.ssh/
    gitSigningKey = "~/.ssh/MVFLP01840.pub";
    gitSigningProgram = null; # uses default (file-based)
    sshExtraConfig = "";
    # Conditional git config for personal repos (path must end with /)
    gitIncludes = [
      {
        condition = "gitdir:~/code/personal/";
        contents = {
          user = {
            email = "5386965+greg-cook@users.noreply.github.com";
            name = "Greg Cook";
            signingkey = "~/.ssh/github_id_ed25519.pub";
          };
        };
      }
    ];
    # Machine-specific session variables
    sessionVariables = {
      AWS_PAGER = "";
      BB_REPO_PATH = "~/projects";
      PATH = "$PATH:~/.local/bin:$BB_REPO_PATH/dev-scripts";
    };
    # Machine-specific homebrew packages
    extraBrews = [ ];
    extraCasks = [ ];
    extraMasApps = { };
    # Machine-specific nix packages (function that takes pkgs)
    extraPackages =
      pkgs: with pkgs; [
        awscli2
        circleci-cli
        scalr-cli
        ssm-session-manager-plugin
        tflint
      ];
  };

  # Personal laptop
  personal = mkHost {
    hostname = "mba";
    username = "gc";
    user = "gc";
    name = "Greg Cook";
    email = "5386965+greg-cook@users.noreply.github.com";
    sshKey = null;
    gitSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK+VGSqIP96us62MMoKVsyAXOA/LVFnWOTJWjLqAU3Le";
    gitSigningProgram = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    sshExtraConfig = ''
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
    gitIncludes = [ ];
    sessionVariables = { };
    extraBrews = [ ];
    extraCasks = [
      "1password"
      "adobe-acrobat-reader"
      "google-chrome"
      "microsoft-excel"
      "microsoft-word"
      "rustdesk"
      "steam"
      "stremio"
      "surfshark"
      "windscribe"
    ];
    extraMasApps = {
      "1Password for Safari" = 1569813296;
    };
    extraPackages =
      pkgs: with pkgs; [
        _1password-cli
      ];
  };
}
