{ pkgs, ... }:

{
  programs.claude-code = {
    enable = true;
    mcpServers = {
      github = {
        command = "${pkgs.github-mcp-server}/bin/github-mcp-server";
        args = [ "stdio" ];
        type = "stdio";
      };
      nix = {
        command = "${pkgs.uv}/bin/uvx";
        args = [ "mcp-nixos" ];
        type = "stdio";
      };
      terraform = {
        command = "${pkgs.terraform-mcp-server}/bin/terraform-mcp-server";
        args = [ "stdio" ];
        type = "stdio";
      };
      aws-mcp = {
        command = "${pkgs.uv}/bin/uvx";
        args = [
          "mcp-proxy-for-aws@latest"
          "https://aws-mcp.us-east-1.api.aws/mcp"
          "--metadata"
          "AWS_REGION=us-west-2"
        ];
        type = "stdio";
      };
    };
    commands = {
      rebase = ''
        ---
        allowed-tools: Bash(git fetch:*), Bash(git rebase:*), Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git remote:*), Bash(git branch:*), Bash(git add:*), Bash(git checkout:*)
        description: Fetch latest from origin default branch and rebase current branch onto it
        ---
        Fetch the latest changes from origin and rebase the current branch onto the default branch.

        Steps:
        1. Run `git remote show origin` to identify the default branch (the "HEAD branch" line)
        2. Run `git fetch origin` to fetch latest changes
        3. Run `git rebase origin/<default-branch>` to rebase
        4. If the rebase encounters conflicts:
           - Show the conflicting files with `git status`
           - Show the diff for each conflict with `git diff`
           - Resolve each conflict by editing the files to keep the correct content (do not simply discard one side — read both versions and produce the right merge)
           - Stage resolved files with `git add <file>`
           - Continue the rebase with `git rebase --continue`
           - Repeat until the rebase completes
        5. Report what happened: which branch was rebased onto what, how many commits were replayed, and whether any conflicts were resolved.
      '';
    };

    settings = {
      # Prevent claude adding itself to commits/prs
      attribution = {
        commit = "";
        pr = "";
      };
      effortLevel = "medium";
      theme = "auto";
    };
  };
}
