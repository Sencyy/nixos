{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		file
		tmux
		parallel
		tree	
		tree
		pciutils
	];
}

