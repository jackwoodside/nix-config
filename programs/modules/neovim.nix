{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      clang-tools
      ltex-ls
      nil
      nixfmt-rfc-style
      shellcheck
      shfmt
      stylua
      sumneko-lua-language-server
      texlab
    ];
  };

  home.packages = with pkgs; [
    cargo
    gcc
    gnumake
    neovim-remote
    unzip
  ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "cefee11499e8fc82b1c28f9c33867d4263d9c1cf";
  };
}
