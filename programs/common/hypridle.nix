{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "${pkgs.hyprlock}/bin/hyprlock";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
