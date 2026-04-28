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
      model = "claude-opus-4-5";
      theme = "dark";
    };
  };
}
