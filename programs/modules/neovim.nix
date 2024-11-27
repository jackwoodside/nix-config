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
    rev = "db627a54ef0b1a0e65d2f8a9a08f3b5cf2741c28";
  };
}
