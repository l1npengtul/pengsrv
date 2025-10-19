{pkgs, ...}: {
nix.settings.trusted-users = ["nixbuild"];
users.users.nixbuild = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ]; #
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHmy492dN8mCQIP/f/ecxu9DIBHbhQF5Yte28CJZ1hgf l1npengtul@protonmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBITwQ7bUgxNBYdQFzWjRQkg9NW9s646icQZ/ifVitD4 l1npengtul@protonmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbe88oJjlFPbgN4pn4v5cdAWGEDiOiwQnEpTXPzSaYS l1npengtul@protonmail.com"
    ];
  };

}
