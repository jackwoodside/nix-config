{ ... }:

{
  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi
    compact = True
    [editor]
    terminal = alacritty
  '';
}
