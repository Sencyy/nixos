{ pkgs, lib, config, ... }:
 
let
  elysia = builtins.getFlake "git+https://dawn.wine/foxtrottt/elysia-on-nix/";
  prismlauncher = builtins.getFlake "git+https://github.com/Diegiwg/PrismLauncher-Cracked";
in {

  # options.gaming = {
  #   allOfGaming.enable = lib.mkEnableOption "Enables all games";
  # };
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

  };


}


