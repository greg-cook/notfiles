{
  pkgs,
  hostConfig,
  nixpkgs-terraform,
  ...
}:

{
  home.packages =
    with pkgs;
    [
      awscli2
      e1s
      fd
      fzf
      gh
      go
      kubernetes-helm
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
