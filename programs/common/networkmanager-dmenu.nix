{ pkgs, ... }:

{
  home.packages = with pkgs; [ network_dmenu ];
  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    compact = True
    dmenu_command = ${pkgs.wofi}/bin/wofi
  '';
}
