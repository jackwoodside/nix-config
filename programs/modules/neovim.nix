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

  # xdg.configFile."nvim".source = builtins.fetchGit {
  #   url = "https://github.com/jackwoodside/nvim-config.git";
  #   shallow = true;
  #   ref = "main";
  #   rev = "6673257a5818b42b56590880e3a75d70030af855";
  # };
}
