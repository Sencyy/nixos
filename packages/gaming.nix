{ pkgs, lib, config, ... }:



let
  elysia = builtins.getFlake "git+https://dawn.wine/foxtrottt/elysia-on-nix/";
in {

  options.gaming = {
    endfield.enable = lib.mkEnableOption "Enable Arknights:Endfield";
  };
  config = {
    environment.systemPackages = if config.gaming.endfield.enable then [
     elysia.packages.x86_64-linux.default
    ] else [];
  };


}


