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
      fd
      fzf
      gh
      mise
      mkcert
      mariadb.client
      nil
      openssl
      python3
      ripgrep
      ruby
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
