{pkgs, ...}: {
  environment.systemPackages = with pkgs; [cockpit];

  services.cockpit = {
    enable = true;
    port = 9090;

    settings = {
      WebService = {
        AllowUnencrypted = false;
      };
    };
  };
}
