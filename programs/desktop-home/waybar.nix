{ ... }:

{
  programs.waybar.settings.mainBar = {
    modules-center = [ "idle_inhibitor" ];
    modules-right = [
      "wireplumber"
      "network"
      "clock"
    ];
  };
}
