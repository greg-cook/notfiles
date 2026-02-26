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
      mise
      mkcert
      nil
      openssl
      python3
      ripgrep
      ruby
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
