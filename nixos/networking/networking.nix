{ config, lib, pkgs, modulesPath, ... }:
{

  # networking.firewall.enable = true;
  # networking.firewall.allowPing = true;

  networking.firewall.allowedTCPPorts = [ 80 8080 3000 ];
  networking.firewall.allowedUDPPorts = [ 1900 config.services.tailscale.port ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}