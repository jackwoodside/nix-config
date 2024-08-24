{ lib, pkgs, ... }:

{
  programs.lf = {
    enable = true;
    previewer.source = pkgs.writeShellScript "previewer.sh" ''
      #!/bin/sh
      case "$1" in
        *.pdf) ${pkgs.poppler_utils}/bin/pdftotext "$1" -;;
        *.tar*) tar tf "$1";;
        *.zip) ${lib.getExe pkgs.unzip} -l "$1";;
        *) ${lib.getExe pkgs.bat} "$1";;
      esac
    '';
  };
}
