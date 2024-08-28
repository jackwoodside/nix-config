{ config, ... }:

let
  colours = config.colorScheme.hashedColors;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = colours.base05;
        background = colours.base00;
        foreground = colours.base05;
        separator_color = "frame";
        offset = "10x10";
        transparency = "20";
        frame_width = "2";
        font = "JetBrainsMono Nerd Font 16";
        idle_threshold = 120;
        line_height = 0;
        word_wrap = "yes";
        show_indicators = "false";

        mouse_left_click = "none";
        mouse_right_click = "none";
      };
      urgency_normal = {
        timeout = 5;
      };
      urgency_low = {
        timeout = 5;
      };
      urgency_critical = {
        frame_color = colours.base08;
        timeout = 0;
      };
    };
  };
}
