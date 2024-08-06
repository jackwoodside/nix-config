{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [ networkmanager_dmenu ];
  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    compact = True
    dmenu_command = ${lib.getExe pkgs.wofi} -P -S dmenu
  '';
}
