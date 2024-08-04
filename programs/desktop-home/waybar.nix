{ ... }:

{
  programs.waybar.settings.mainBar = {
    modules-right = [
      "wireplumber"
      "network"
      "clock"
    ];
  };
}
