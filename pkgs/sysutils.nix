{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dpkg
    binutils
    upx
    tmux
    popsicle
    hyfetch
    zenith
    onefetch
    exfat
    exfatprogs
    xfsprogs
    f3
    freshfetch
    micro-full
    zgrviewer
    fd
    dmg2img
    ipmicfg
    ipmiview
    ntfs3g
    util-linux
    gptfdisk
    gparted
    btrfs-progs
  ];
}
