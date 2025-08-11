{
  pkgs,
  inputs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.enableRedistributableFirmware = true;

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  services.libinput.enable = true;
  programs.dconf.enable = true;
  programs.ssh.startAgent = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    git-lfs
    sof-firmware
    unzip
    p7zip
    nix-index
    pciutils
    usbutils
    nmap
    inputs.agenix.packages.${pkgs.system}.default
  ];

  environment.pathsToLink = [
    "/bin"
    "/lib"
    "/lib64"
    "/etx/xdg"
    "/sbin"
    "/share/applications"
    "/share/emacs"
    "/share/hunspell"
    "/share/nano"
    "/share/org"
    "/share/themes"
    "/share/vim-plugins"
    "/share/vulkan"
    "/share/kservices5"
    "/share/kservicetypes5"
    "/share/kxmlgui5"
    "/share/systemd"
    "/share/thumbnailers"
    "/share/xdg-desktop-portal"
    "/share/qemu"
    "/sys"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware.enableAllFirmware = true;

  boot.tmp.useTmpfs = true;
  boot.tmp.cleanOnBoot = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };

  nix.settings.auto-optimise-store = true;

  security.polkit.enable = true;
}
