{ hostConfig, ... }:

{
  system.primaryUser = hostConfig.username;

  # Declare the user that will be running `nix-darwin`.
  users.users.${hostConfig.user} = {
    name = hostConfig.username;
    home = "/Users/${hostConfig.username}";
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
