{ config, pkgs, lib, ... }: 
{
  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
}
