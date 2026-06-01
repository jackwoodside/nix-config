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
    rev = "bb59f59f5469095a00acc9e8bf5e1e243ce13924";
  };
}
