{ config, pkgs, ... }:

{
  services.xserver.displayManager.gdm.enable = true;

  programs.dconf.enable = true;

  programs.dconf.profiles = {
    gdm.databases = [{
      settings = {
        "org/gnome/desktop/peripherals/keyboard" = {
          numlock-state = true;
          remember-numlock-state = true;
        };
      };
    }];
  };

}