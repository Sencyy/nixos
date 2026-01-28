{ pkgs, ... }:
{
  imports = [
    ../MachineTypes/desktop.nix
    ../packages/gaming.nix
  ];

  services.desktopManager.plasma6.enable = true;

  # Background services
  services.ollama.enable = true;
  services.ollama.acceleration = "vulkan";
  services.nextjs-ollama-llm-ui.enable = true;

  services.actual.enable = true;



}