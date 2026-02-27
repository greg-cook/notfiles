{ hostConfig, ... }:

{
  programs.awscli = {
    enable = true;
    settings = {
      default = {
        region = hostConfig.awsConfig.region;
        output = hostConfig.awsConfig.output;
      };
    };
  };
}
