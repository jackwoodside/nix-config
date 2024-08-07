{ ... }:

{
  programs.spotify-player = {
    enable = true;
    settings = {
      cover_image_length = 9;
      cover_image_width = 9;
      enable_notify = false;
      theme = "catppuccin-mocha";
    };
    themes = [
      {
        name = "catppuccin-mocha";
        palette = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          black = "#1e1e2e";
          blue = "#89b4fa";
          cyan = "#89dceb";
          green = "#a6e3a1";
          magenta = "#cba6f7";
          red = "#f38ba8";
          white = "#cdd6f4";
          yellow = "#f9e2af";
          bright_black = "#1e1e2e";
          bright_blue = "#89b4fa";
          bright_cyan = "#89dceb";
          bright_green = "#a6e3a1";
          bright_magenta = "#cba6f7";
          bright_red = "#f38ba8";
          bright_white = "#cdd6f4";
          bright_yellow = "#f9e2af";
        };
        component_style = {
          selection = {
            bg = "#313244";
            modifiers = [ "Bold" ];
          };
        };
      }
    ];
  };
}
