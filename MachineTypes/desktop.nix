{ pkgs, ... }:

{
  imports = [ 
    ../core.nix
    ../packages/development.nix
    (builtins.getFlake "github:gmodena/nix-flatpak?ref=v0.7.0").nixosModules.nix-flatpak
  ];

  # boot.kernelPackages = pkgs.linuxPackages_zen; gotta enable it later, but it kinda sucks cuz need to build the kernel

  services.displayManager.ly.enable = true;

  services.tailscale.enable = true;

  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true;
  services.flatpak.packages = [
    "com.usebottles.bottles"
    "com.actualbudget.actual"
  ];

  environment.systemPackages = with pkgs; [
    #Core system utilities
    eza
    bat
  
    # Daily usage
    librewolf-bin
    vesktop
    thunderbird
    
    # Multimedia
    mpv
    gpodder

  ];
}