{
  pkgs,
  hostConfig,
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
      mariadb.client
      mkcert
      nil
      openssl
      ripgrep
      shellcheck
      sslscan
      uv
      wakeonlan
      watch
      wget
      xz
      yq-go
    ]
    ++ (hostConfig.extraPackages pkgs);
}
