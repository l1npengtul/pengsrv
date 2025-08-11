{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [mcrcon];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    managementSystem = {
      tmux.enable = false;
      systemd-socket.enable = true;
    };
    servers.fabric = {
      enable = true;

      serverProperties = {
        difficulty = "hard";
        motd = "callluuum >>>>>> calluum";
        gamemode = "survival";
        level-name = "world";
        max-players = 20;
        white-list = true;
        view-distance = "8";
        sync-chunk-writes = false;
        max-chained-neighbor-updates = 10000;
        enable-rcon = true;
        "rcon.password" = "sealcraft";
      };

      jvmOpts = "-Xms4096M -Xmx4096M --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20";

      package = pkgs.fabricServers.fabric-1_21_8.override {
        loaderVersion = "0.17.2";
        jre_headless = pkgs.temurin-jre-bin-23;
      };
    };
  };
}
