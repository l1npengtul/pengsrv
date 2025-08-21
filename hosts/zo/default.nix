{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disk.nix
    ./../common
  ];

  time.timeZone = "France/Paris";

  networking.hostName = "zo";
  networking.firewall.enable = true;
}
