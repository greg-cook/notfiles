{ ... }:

{
  programs.mise = {
    enable = true;
    enableZshIntegration = true;
    globalConfig = {
      tools = {
        golang = "1.25";
        node = "22";
        python = "3";
        ruby = "3";
        terraform = "1.5.7";
      };
      settings = {
        idiomatic_version_file_enable_tools = [
          "node"
          "python"
          "ruby"
          "terraform"
        ];
      };
    };
  };
}
