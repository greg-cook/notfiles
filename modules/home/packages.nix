{
  pkgs,
  hostConfig,
  nixpkgs-terraform,
  nixpkgs-terraform-docs,
  bitbucket-cli,
  ...
}:

{
  home.packages =
    with pkgs;
    [
      _1password-cli
      awscli2
      e1s
      fd
      fzf
      gh
      gnupg
      go
      mariadb.client
      mkcert
      neovim
      nil
      nodejs
      pnpm
      openssl
      pre-commit
      ripgrep
      shellcheck
      sslscan
      tart
      nixpkgs-terraform.packages.${pkgs.stdenv.hostPlatform.system}."terraform-1.5.7"
      bitbucket-cli.packages.${pkgs.stdenv.hostPlatform.system}.default
      nixpkgs-terraform-docs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.terraform-docs
      tflint
      tflint-plugins.tflint-ruleset-aws
      uv
      wakeonlan
      watch
      wget
      xz
      yq-go
    ]
    ++ (hostConfig.extraPackages pkgs);
}
