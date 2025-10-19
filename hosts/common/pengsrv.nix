{pkgs, ...}: {
  users.users.pengsrv = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "libvirtd"
      "jackaudio"
      "adbusers"
      "kvm"
      "scanner"
      "lp"
      "cdrom"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      helix
      micro
      git
      curl
      wget
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHmy492dN8mCQIP/f/ecxu9DIBHbhQF5Yte28CJZ1hgf l1npengtul@protonmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBITwQ7bUgxNBYdQFzWjRQkg9NW9s646icQZ/ifVitD4 l1npengtul@protonmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILbe88oJjlFPbgN4pn4v5cdAWGEDiOiwQnEpTXPzSaYS l1npengtul@protonmail.com"
    ];
    initialHashedPassword = "$y$j9T$Hxz8ho03ihT1n1y/NnJSG1$9Qw36dG2avTNMXTbPrLA9EcjKmtaFWi.wm2plKrdlaB";
  };
  programs.fish.enable = true;
}
