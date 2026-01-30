{ hostConfig, ... }:

{
  networking = {
    computerName = hostConfig.hostname;
    hostName = hostConfig.hostname;
  };
}
