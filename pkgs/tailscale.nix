{pkgs, ...}: {
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaes = ["tailscale0"];
}
