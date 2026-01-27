{ pkgs, ... }:
{
  imports = [ ../MachineTypes/desktop.nix ];

  services.xserver.enable = true;
  services.xserver.desktopManager.mate.enable = true;


}