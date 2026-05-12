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
      atlassian-rovo-mcp = {
        command = "${pkgs._1password-cli}/bin/op";
        args = [
          "run"
          "--no-masking"
          "--"
          "npx"
          "-y"
          "mcp-remote"
          "https://mcp.atlassian.com/v1/mcp"
          "--header"
          "Authorization: Basic $ATLASSIAN_API_TOKEN"
          "--ignore-tool"
          "getTeamworkGraphContext"
          "--ignore-tool"
          "getTeamworkGraphObject"
          "--ignore-tool"
          "jiraIssue"
          "--ignore-tool"
          "jiraProject"
          "--ignore-tool"
          "jiraSearch"
          "--ignore-tool"
          "confluencePage"
          "--ignore-tool"
          "confluenceSpace"
          "--ignore-tool"
          "confluenceSearch"
        ];
        type = "stdio";
        env = {
          ATLASSIAN_API_TOKEN = "op://Private/Atlassian API Token/credential";
        };
      };
    };
    settings = {
      # Prevent claude adding itself to commits/prs
      attribution = {
        commit = "";
        pr = "";
      };
      effortLevel = "medium";
      model = "claude-opus-4-5";
      theme = "dark";
      enabledPlugins = {
        "bkt@avivsinai-marketplace" = true;
      };
      extraKnownMarketplaces = {
        avivsinai-marketplace = {
          source = {
            source = "github";
            repo = "avivsinai/skills-marketplace";
          };
        };
      };
    };
  };
}
