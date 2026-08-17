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

    fd
    ripgrep
    tree-sitter

    bash-language-server
    black
    clang-tools
    jq
    ltex-ls
    lua-language-server
    nil
    nixfmt
    pyright
    shellcheck
    shfmt
    stylua
    tectonic
    texlab
  ];

  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "d214ceea38bc9e10345c8483d0cda378a09d8026";
  };
}
