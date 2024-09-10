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
    rev = "036219c069d8e212c9c5779b2b64623d9aa1c821";
  };
}
