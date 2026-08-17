{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      disabledTrayIcon = true;
      showHelp = false;
      showStartupLaunchMessage = false;
    };
  };
}
