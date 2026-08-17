{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showHelp = false;
        showStartupLaunchMessage = false;
      };
    };
  };
}
