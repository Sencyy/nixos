{ pkgs, ... }:
let 
  flatpak = builtins.getFlake "github:gmodena/nix-flatpak?ref=v0.7.0";
in 

{
  imports = [ 
    ../core.nix
    ../packages/development.nix
    ../home/home.nix
    flatpak.nixosModules.nix-flatpak
    
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

  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    maple-mono.truetype
    maple-mono.NF-unhinted

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