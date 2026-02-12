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
	    ".bashrc".source = ./dotfiles/.bashrc;
      ".gitconfig".source = ./dotfiles/.gitconfig;
	    ".vimrc".source = ./dotfiles/.vimrc;
	    ".config/sway/config".source = ./dotfiles/sway;
	    ".config/i3status/config".source = ./dotfiles/i3status;
	    ".config/foot/foot.ini".source = ./dotfiles/foot.ini;
	    ".config/gammastep/config.ini".source = ./dotfiles/gammastep; 
    };


    home.stateVersion = "25.11";
  };
}
