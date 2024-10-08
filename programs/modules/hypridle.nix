{ lib, pkgs, ... }:

let
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";
  hyprlock = "${lib.getExe pkgs.hyprlock}";
in
{
  services.hypridle =

    {
      enable = true;
      settings = {
        general = {
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "${hyprctl} dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "pidof ${hyprlock} || ${hyprlock}";
        };

        listener = [
          # After 5 minutes, lock device
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }

          # After 5.5 minutes, screen off
          {
            timeout = 330;
            on-timeout = "${hyprctl} dispatch dpms off";
            on-resume = "${hyprctl} dispatch dpms on";
          }

          # After 30 minutes, suspend device
          # Disabled since breaks NetworkManager
          # {
          #   timeout = 1800;
          #   on-timeout = "systemctl suspend";
          # }
        ];
      };
    };
}
