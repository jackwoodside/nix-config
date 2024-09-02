{ config, ... }:

let
  colours = config.colorScheme.hashedColors;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = 0;

      # Theme
      foreground = colours.base05;
      background = colours.base00;
      selection_foreground = colours.base00;
      selection_background = colours.base06;

      cursor = colours.base06;
      cursor_text_color = colours.base00;
      url_color = colours.base06;

      active_tab_foreground = "#11111b";
      active_tab_background = colours.base0E;
      inactive_tab_foreground = colours.base05;
      inactive_tab_background = colours.base01;
      tab_bar_background = "#11111b";

      mark1_foreground = colours.base00;
      mark1_background = colours.base07;
      mark2_foreground = colours.base00;
      mark2_background = colours.base0E;
      mark3_foreground = colours.base00;
      mark3_background = "#74c7ec";

      color0 = colours.base03;
      color1 = colours.base08;
      color2 = colours.base0B;
      color3 = colours.base0A;
      color4 = colours.base0D;
      color5 = "#f5c2e7";
      color6 = colours.base0C;
      color7 = "#bac2de";
      color8 = colours.base04;
      color9 = colours.base08;
      color10 = colours.base0B;
      color11 = colours.base0A;
      color12 = colours.base0D;
      color13 = "#f5c2e7";
      color14 = colours.base0C;
      color15 = "#a6adc8";
    };
  };
}
