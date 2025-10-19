{pkgs, ...}: {
  imports = [
#     ./hardware-configuration.nix
    ./disk.nix
    ./../common
  ];

  time.timeZone = "Asia/Tokyo";

  networking.hostName = "celt";
  networking.firewall.enable = true;

  system.stateVersion = "25.05";
}
