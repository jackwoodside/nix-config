{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledGrimWarning = true;
        disabledTrayIcon = true;
        showAbortNotification = false;
        showDesktopNotification = false;
        showHelp = false;
        showSidePanelButton = false;
        showStartupLaunchMessage = false;
        uiColor = "#cdd6f4";
        useGrimAdapter = true;
      };
    };
  };
}
