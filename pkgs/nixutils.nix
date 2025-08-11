{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nil
    nixfmt-rfc-style
    inputs.alejandra.defaultPackage.${pkgs.system}
    patchelfUnstable
    file
    nix-prefetch-github
    nixpkgs-review
    nix-update
    nix-du
  ];
  programs.nix-index-database.comma.enable = true;
}
