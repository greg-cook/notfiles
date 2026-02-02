{
  pkgs,
  hostConfig,
  ...
}:

{
  home.packages =
    with pkgs;
    [
      autoconf
      claude-code
      fd
      fzf
      gemini-cli
      gh
      helix
      lazydocker
      luarocks
      mise
      mkcert
      mariadb.client
      nil
      openssl
      pkg-config
      pwgen
      python3
      readline
      ripgrep
      ruby
      sslscan
      tflint
      totp-cli
      treefmt
      wakeonlan
      watch
      wget
      xz
      yq-go
      zlib
    ]
    ++ (hostConfig.extraPackages pkgs);
}
