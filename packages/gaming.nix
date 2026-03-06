{ pkgs, lib, config, ... }:
 
let
  elysia = builtins.getFlake "git+https://dawn.wine/foxtrottt/elysia-on-nix/";
  prismlauncher = builtins.getFlake "git+https://github.com/Diegiwg/PrismLauncher-Cracked";
in
{
config = {
  # Enabling everything
  environment.systemPackages = [
    elysia.packages.x86_64-linux.default
    prismlauncher.packages.x86_64-linux.default
    pkgs.osu-lazer
    pkgs.heroic
    pkgs.openttd
  ];
  programs.steam.enable = true;

	# Install games using flatpak
	# Only works if services.flatpak.enable is set to true
	services.flatpak.packages = mkIf services.flatpak.enable [
		"sh.ppy.osu"
	];
};


}


