{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [ bun ];

  programs.ags = {
    enable = true;
    configDir = ../ags;
  };
}
