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
    rules = {
      git-workflow = ''
        ---
        alwaysApply: true
        ---

        # Git Workflow

        Before starting any implementation work:

        1. Identify the default branch with `git remote show origin | grep 'HEAD branch'`
        2. Fetch latest: `git fetch origin`
        3. Create and switch to a new branch from the tip of the default branch:
           `git checkout -b <branch-name> origin/<default-branch>`

        Branch names should reflect the type of work using the same prefixes as conventional commits:
        `feat/`, `fix/`, `docs/`, `refactor/`, `chore/`, `ci/`, `perf/`, `test/`
        followed by a short kebab-case description, e.g. `feat/add-login-page`.

        Never commit directly to the default branch.
      '';

      conventional-commits = ''
        ---
        alwaysApply: true
        ---

        # Conventional Commits

        All commits must follow the Conventional Commits specification:

        ```
        <type>[(scope)][!]: <description>

        [optional body]

        [optional footer(s)]
        ```

        Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`, `ci`, `build`, `revert`

        Rules:
        - Description is lowercase, imperative mood, no trailing period, max 72 chars total
        - Use `!` after type/scope or `BREAKING CHANGE:` footer for breaking changes
        - Scope is optional but encouraged when the change is localized (e.g. `fix(auth): ...`)
        - Body and footers are separated from the subject by a blank line
      '';
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
