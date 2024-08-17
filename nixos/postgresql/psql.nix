{config,pkgs,...}:
{
  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "devDB" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser origin-address auth-method
      local  all      all                     trust

      # ipv4
      host   all      all     127.0.0.1/32     md5
      
      # ipv6
      host   all      all     ::1/128          md5
    ''
  };
}