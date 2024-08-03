{ ... }:

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
          path = "/home/jack/Downloads/lock.png";
          size = 500;
          border_color = "rgb(cdd6f4)";
          border_size = 3;
          position = "0, 0";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          outline_thickness = 3;
          position = "0, -350";

          font_color = "rgb(cdd6f4)";
          inner_color = "rgb(1e1e2e)";
          outer_color = "rgb(cdd6f4)";
          check_color = "rgb(cdd6f4)";
          fail_color = "rgb(f38ba8)";

          fade_on_empty = false;
          placeholder_text = "";
          fail_text = "";
        }
      ];
    };
  };
}
