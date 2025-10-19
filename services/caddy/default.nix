{config, pkgs, ...}: {
	services.caddy = {
		enable = true;
		package = pkgs.caddy.withPlugins {
			plugins = [ "github.com/caddy-dns/cloudflare@v0.2.1" ];
			hash = "";
		};
	};
	systemd.services.caddy.serviceConfig.EnvironmentFile = config.sercrets
}
