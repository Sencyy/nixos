{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../MachineTypes/desktop.nix
    ../../packages/gaming.nix
		../../packages/desktops/plasma.nix # KDE Pasma desktop
  ];

  # Background services
  services.ollama.enable = true;
  services.ollama.acceleration = "vulkan";
  services.nextjs-ollama-llm-ui.enable = true;


  services.hardware.openrgb.enable = true;

}
