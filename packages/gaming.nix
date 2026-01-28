{ pkgs, lib, config, ... }:
 
let
  elysia = builtins.getFlake "git+https://dawn.wine/foxtrottt/elysia-on-nix/";
in {

  options.gaming = {
    allOfGaming.enable = lib.mkEnableOption "Enables all games";

    endfield.enable = lib.mkEnableOption "Enable Arknights:Endfield";
    osu.enable = lib.mkEnableOption "Enable osu!lazer game";
    steam.enable = lib.mkEnableOption "Enable steam";
    heroic.enable = lib.mkEnableOption "Enable Heroic games Launcher";
    openttd.enable = lib.mkEnableOption "Enable OpenTTD";
  };
  config = {
    # Enabling everything
    environment.systemPackages = if config.gaming.allOfGaming.enable then [
      elysia.packages.x86_64-linux.default
      osu-lazer
      heroic
      openttd
    ] else [];

    programs.steam.enable = if config.gaming.allOfGaming.enable then true else false;

    environment.systemPackages = if config.gaming.endfield.enable then [
     elysia.packages.x86_64-linux.default
    ] else [];

    environment.systemPackages = if config.gaming.osu.enable then [
      osu-lazer
    ] else [];

    programs.steam.enable = if config.gaming.steam.enable then true else false;

    environment.systemPackages = if config.gaming.heroic.enable then [
      heroic
    ] else [];

    environment.systemPackages = if config.gaming.openttd.enable then [
      openttd
    ] else [];


  };


}


