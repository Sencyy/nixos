{ pkgs, external ... }:
{
  imports = [ ../core.nix ];

  # boot.kernelPackages = pkgs.linuxPackages_zen;

  services.displayManager.ly.enable = true;

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    # Development tools
    git
    go
    vscode
    lazygit
    dotnet-sdk_10
    vim
    fastfetch

    # Automation
    ansible

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