{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
  };

  home.packages = with pkgs; [
    gcc
    gnumake
    neovim-remote

    clang-tools
    ltex-ls
    nil
    nixfmt-rfc-style
    shellcheck
    shfmt
    stylua
    lua-language-server
    texlab
  ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "e13b7d02d1d3675fc4b565754d52d4cebdbc9c6b";
  };
}
