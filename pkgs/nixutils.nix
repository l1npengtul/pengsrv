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
    agenix-cli
    age
    ssh-to-age
  ];
  programs.nix-index-database.comma.enable = true;
}
