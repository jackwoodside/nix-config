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
    rev = "f93085fdd510a05cc3146bd9711b87f57a5529dc";
  };
}
