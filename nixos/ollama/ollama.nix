{ config, lib, pkgs, modulesPath, ... }:
{

    services.ollama = {
    enable = true;
    acceleration = "cuda";
    };
}