{ lib, pkgs, ... }:

let
  pistol = "${lib.getExe pkgs.pistol}";
in
{
  programs.lf = {
    enable = true;

    keybindings = {
      p = "paste; clear";
    };

    previewer.source = pkgs.writeShellScript "previewer.sh" ''
      #!/bin/sh
      ${pistol} "$1"
    '';

    settings = {
      dircounts = true;
      drawbox = true;
      icons = true;
      incsearch = true;
      relativenumber = true;
      scrolloff = true;
    };
  };
}
