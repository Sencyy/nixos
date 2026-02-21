{ config, pkgs, ... }:
let
  home = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
in
{
  imports = [
    (import "${home}/nixos")
  ];

  users.users.hanako.isNormalUser = true;
  home-manager.users.hanako = { pkgs, ... }: {
    home.packages = with pkgs; [
      
    ];

    # Shell Customization
    home.shell.enableShellIntegration = true;
    programs.zsh = {
      enable = true;
      shellAliases = {
	nano = "nano -i";
	stow = "stow -t ~/";
	ls = "eza -l --icons --git";
	ll = "eza -la --icons --git";
	ip = "ip -c";
	cat = "bat";
	grep = "rg";
	sxiv = "nsxiv";
	tmpsh = "podman ruin --volume $(pwd):/directory --rm -it";
	qr = "qrencode -t UTF8";
				lg = "lazygit";

	# Directory management aliases
	cp = "cp -v";
	mv = "mv -v";
	rm = "rm -v";
	mkdir = "mkdir -pv";
	rmdir = "rmdir -v";
      };
      oh-my-zsh = {
        enable = true;
        theme = "half-life";
        plugins = [
          "git"
          "command-not-found"
          "golang"
        ];
      };
    };
    programs.direnv.enable = true;
    programs.direnv.enableZshIntegration = true;

    # Environment
    home.sessionVariables = {
      EDITOR = "vim";
    };

    # Dotfiles
    home.file = {
	    ".bashrc" = {
	    	force = true;
	    	source = ./dotfiles/.bashrc;
	    };
      	    ".gitconfig" = {
      	    	force = true;
      	    	source = ./dotfiles/.gitconfig;
      	    };
	    ".vimrc" = {
	    	force = true;
	    	source = ./dotfiles/.vimrc;
	    };
	    ".config/sway/config"= {
		force = true;
	    	source = ./dotfiles/sway;
	    };
	    ".config/i3status/config" = {
	    	force = true;
	    	source = ./dotfiles/i3status;
	    };
	    ".config/foot/foot.ini" = {
		force = true;
	    	source = ./dotfiles/foot.ini;
	    };
	    ".config/gammastep/config.ini" = {
	    	force = true;
	    	source = ./dotfiles/gammastep;
	    } ;
    };


    home.stateVersion = "25.11";
  };
}
