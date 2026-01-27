{ pkgs, external, ... }:
{
  environment.systemPackages = [
    external.elysia.packages.x86_64-linux.default
  ].
}