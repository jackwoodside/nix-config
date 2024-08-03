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
        };
      };
    };
    style = ./catppuccin.css;
  };
}
