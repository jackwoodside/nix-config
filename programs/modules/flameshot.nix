{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledGrimWarning = true;
        disabledTrayIcon = true;
        showHelp = false;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
      };
    };
  };
}
