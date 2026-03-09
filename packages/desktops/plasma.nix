{ pkgs, ... }:
{

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.partitionmanager
  ];
	
	# Enabling KDE Connect
	programs.kdeconnect.enable = true;

}
