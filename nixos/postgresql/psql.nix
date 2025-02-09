{config,pkgs,...}:
{
  config.services.postgresql = {
    enable = false;
  };
}