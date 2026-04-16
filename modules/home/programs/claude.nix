{ pkgs, ... }:

{
  programs.claude-code = {
    enable = true;
    mcpServers = {
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
    settings = {
      # Prevent claude adding itself to commits/prs
      attribution = {
        commit = "";
        pr = "";
      };
      effortLevel = "medium";
      theme = "dark";
    };
  };
}
