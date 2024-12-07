{ lib, pkgs, ... }:

let
  bat = "${lib.getExe pkgs.bat}";
  eza = "${lib.getExe pkgs.eza}";
  fd = "${lib.getExe pkgs.fd}";
  neovim = "${lib.getExe pkgs.neovim}";
  ripgrep = "${lib.getExe pkgs.ripgrep}";
  starship = "${lib.getExe pkgs.starship}";
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${starship} init fish | source
    '';
    shellInit = ''
      set -U fish_greeting
      set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
      set -gx LESSHISTFILE -
      set -gx EDITOR ${neovim}
      set -gx PATH $PATH:/home/jack/.local/bin
    '';
    # set -gx MANPAGER 'nvim +Man!'
    shellAliases = {
      c = "clear";
      cat = "${bat}";
      find = "${fd}";
      grep = "${ripgrep}";
      ls = "${eza} --icons -T -L=1";
      ls2 = "${eza} --icons -T -L=2";
      ls3 = "${eza} --icons -T -L=3";
      ls4 = "${eza} --icons -T -L=4";
      ls5 = "${eza} --icons -T -L=5";
      vim = "${neovim}";
    };
  };
}
