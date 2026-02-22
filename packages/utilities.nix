{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		file
		tmux
		parallel
		tree
		pciutils
		btop	
	];
}

