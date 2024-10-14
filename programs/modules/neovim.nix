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
    latexindent
    ltex-ls
    lua-language-server
    nil
    nixfmt-rfc-style
    shellcheck
    shfmt
    stylua
    texlab
  ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "45e0bc1037b3a54bb8a0c35a109e224e7d8cec9e";
  };
}
