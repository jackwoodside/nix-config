{ lib, pkgs, ... }:

let
  brightnessctl = "${lib.getExe pkgs.brightnessctl}";
in
{
  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        # After 4.5 minutes, dim screen
        {
          timeout = 270;
          on-timeout = "${brightnessctl} -s set 5%";
          on-resume = "${brightnessctl} -r";
        }
      ];
    };
  };
}
