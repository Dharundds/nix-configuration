{ config, pkgs, lib, ... }: 
{
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    # xwayland.enable = true;
  };

  environment.sessionVariables = {
    # # If your cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    # # Hint electron apps to use wayland
    # NIXOS_OZONE_WL = "1";
  };
}