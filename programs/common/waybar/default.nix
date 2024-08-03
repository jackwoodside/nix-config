{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 5;

        modules-left = [ "hyprland/workspaces" ];
        # modules-right defined per system

        "hyprland/workspaces" = {
          format = "{id} {name}";
          sort-by = "id";
          tooltip = false;
        };

        "backlight" = {
          # device defined per system
          format = "{icon} {percent}%";
          format-icons = [
            "󰪟"
            "󰪡"
            "󰪣"
            "󰪥"
          ];
          tooltip = false;
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
          ];
          states = [
            "warning = 25"
            "critical = 10"
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

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰖀"
            "󰕾"
          ];
          on-click = "${pkgs.kitty}/bin/kitty ${pkgs.pulsemixer}/bin/pulsemixer";
          scroll-step = 0;
          tooltip = false;
        };
      };
    };
    style = ./catppuccin.css;
  };
}
