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

    black
    clang-tools
    ltex-ls
    lua-language-server
    nil
    nixfmt-rfc-style
    pyright
    shellcheck
    shfmt
    stylua
    texlab
  ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "39765e9a7c65e0dd6a36e10f9c3bfe99d78793b3";
  };
}
