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
      lua-language-server
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
    rev = "64133a025880e545e85f633d42dd68b5b3d4d2de";
  };
}
