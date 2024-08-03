{ ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 1; # expands to content
        modules-left = [ "hyprland/workspaces" ];
        # modules-right defined per system

        "hyprland/workspaces" = {
          format = "{id} {name}";
          sort-by = "id";
          tooltip = false;
        };

        "backlight" = {
          # device defined per system
          format = "{icon} :{percent}%";
          format-icons = [
            "󰪟"
            "󰪡"
            "󰪣"
            "󰪥"
          ];
          tooltip = false;
        };

        "battery" = {
          format = "{icon} :{capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };

        "clock" = {
          tooltip = false;
        };

        "network" = {
          format = "󰖩";
          format-disconnected = "󰖪";
          tooltip = false;
        };
      };
    };
    style = ./catppuccin.css;
  };
}
