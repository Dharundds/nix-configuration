{ config, pkgs, lib, ... }: 
{
  programs.eww.enable = true;
  # services.xserver.desktopManager.gnome.enable = false;
}