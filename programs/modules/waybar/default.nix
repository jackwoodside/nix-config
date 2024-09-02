{ lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 5;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        # other modules defined per system

        "backlight" = {
          # device defined per system
          format = "{icon} {percent}%";
          format-icons = [
            "󱩏"
            "󱩑"
            "󱩓"
            "󱩕"
            "󰛨"
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

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
          timeout = 60;
          tooltip = false;
        };

        "network" = {
          format = "󰖩";
          format-disconnected = "󰖪";
          on-click = "${lib.getExe pkgs.networkmanager_dmenu}";
          tooltip = false;
        };

        "hyprland/submap" = {
          format = "󰙖";
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
          on-click = "${lib.getExe pkgs.kitty} --class pulsemixer ${lib.getExe pkgs.pulsemixer}";
          scroll-step = 0;
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{id}"; # {name}";
          sort-by = "id";
          tooltip = false;
        };
      };
    };
    style = ./waybar.css;
  };
}
