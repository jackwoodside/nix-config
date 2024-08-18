{ ... }:

{
  programs.waybar.settings.mainBar = {
    modules-center = [ "idle_inhibitor" ];
    modules-right = [
      "wireplumber"
      "battery"
      "backlight"
      "network"
      "clock"
    ];

    "backlight".device = "amdgpu_bl1";
  };
}
