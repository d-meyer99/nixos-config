{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = true;

    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser auth-method
      local all      all    trust

      #type database DBuser origin-address auth-method
      # ipv4
      host  all      all    127.0.0.1/32   trust
      # ipv6
      host  all      all    ::1/128        trust
    '';

    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE admin WITH LOGIN PASSWORD 'admin' CREATEDB;
      CREATE DATABASE nixcloud;
      GRANT ALL PRIVILEGES ON DATABASE nixcloud TO admin;
    '';

    identMap = ''
      # ArbitraryMapName systemUser DBUser
        superuser_map    root       postgres
        superuser_map    postgres   postgres
        superuser_map    dm         postgres
    '';
  };
}
