{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
  ];

  services.flameshot = {
    enable = true;
    package = pkgs.unstable.flameshot;
    settings = {
      General = {
        disabledTrayIcon = true;
        showAbortNotification = false;
        showDesktopNotification = false;
        showHelp = false;
        showSidePanelButton = false;
        showStartupLaunchMessage = false;
        uiColor = "#cdd6f4";
      };
    };
  };
}
