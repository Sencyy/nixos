{ pkgs, ... }:
{
  imports = [ 
    ../core.nix
    ../packages/development.nix
  ];

  # boot.kernelPackages = pkgs.linuxPackages_zen; gotta enable it later, but it kinda sucks cuz need to build the kernel

  services.displayManager.ly.enable = true;

  services.tailscale.enable = true;

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