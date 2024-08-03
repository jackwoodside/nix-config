{ ... }:

{
  programs.waybar.settings.mainBar = {
    modules-right = [
      "network"
      "battery"
      "backlight"
      "clock"
    ];

    "backlight".device = "amdgpu_bl1";
  };
}
