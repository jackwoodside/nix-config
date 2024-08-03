{ ... }:

{
  programs.waybar.settings.mainBar = {
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
