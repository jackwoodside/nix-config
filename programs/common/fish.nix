{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${pkgs.starship}/bin/starship init fish | source
    '';
    shellInit = ''
      set -U fish_greeting
      set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
      set -gx LESSHISTFILE -
      set -gx EDITOR ${pkgs.helix}/bin/hx
      set -gx PATH $PATH:/home/jack/.local/bin
    '';
    # set -gx MANPAGER 'nvim +Man!'
    shellAliases = {
      c = "clear";
      cat = "${pkgs.bat}/bin/bat";
      find = "${pkgs.fd}/bin/fd";
      grep = "${pkgs.ripgrep}/bin/rg";
      ls = "${pkgs.eza}/bin/eza --icons -T -L=1";
      ls2 = "${pkgs.eza}/bin/eza --icons -T -L=2";
      ls3 = "${pkgs.eza}/bin/eza --icons -T -L=3";
      ls4 = "${pkgs.eza}/bin/eza --icons -T -L=4";
      ls5 = "${pkgs.eza}/bin/eza --icons -T -L=5";
    };
  };
}
