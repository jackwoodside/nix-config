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

  home.packages = with pkgs; [ neovim-remote ];
  xdg.configFile."nvim".source = builtins.fetchGit {
    url = "https://github.com/jackwoodside/nvim-config.git";
    shallow = true;
    ref = "main";
    rev = "f9a38c863dad4dbf83c5283c76c56825484f351c";
  };
}
