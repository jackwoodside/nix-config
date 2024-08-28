{ config, inputs, ... }:

let
  colours = config.colorScheme.hyprColors;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 1;
        }
      ];

      image = [
        {
          path = "${inputs.self}/images/lock.png";
          size = 500;
          border_color = colours.base05;
          border_size = 3;
          position = "0, 0";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          outline_thickness = 3;
          position = "0, -350";

          font_color = colours.base05;
          inner_color = colours.base00;
          outer_color = colours.base05;
          check_color = colours.base05;
          fail_color = colours.base08;

          fade_on_empty = false;
          placeholder_text = "";
          fail_text = "";
        }
      ];
    };
  };
}
