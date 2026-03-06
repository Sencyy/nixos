{ pkgs, lib, ... }:
{
  imports = [ 
    ../MachineTypes/desktop.nix
     ];

	services.displayManager.ly.enable = lib.mkForce false;
	
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;

	qt = {
		enable = true;
		platformTheme = "gnome";
		style = "adwaita-dark";
	};

}
