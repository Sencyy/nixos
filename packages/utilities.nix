{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		eza
		bat
		ripgrep
		file
		tmux
		parallel
		tree
		pciutils
		btop	
	];
}

