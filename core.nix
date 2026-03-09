{pkgs, ...}:
{
  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

	nix.settings.auto-optimise-store = true;
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 14d";

	};

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Timezone
  time.timeZone = "America/Fortaleza";

  # Locales / KB Layout
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.extraLocales = [ "en_US.UTF-8/UTF-8" ];
  services.xserver.xkb.layout = "br";

  # Network
  networking.networkmanager.enable = true;
	
	# Users ( something tells me this should be handled by home-manager already )
  users.users.hanako = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$7ON/17gkWqD9Hexro3lWY.$BHzzrxfbbHCiacuNr9sD5R6oMhgU2Pk9vmi8rClUKI7"; # TODO: Use a real hashed passwd here
  };

  # Shared Programs
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;

	# Running dinamically linked executables
	programs.nix-ld = {
		enable = true;
		libraries = with pkgs; [
			# Libraries for that these binaries depend
		];
	};

  # Containerization
  virtualisation.podman = {
		enable = true;
		dockerCompat = true;
		defaultNetwork.settings.dns_enabled = true;
	};

	environment.systemPackages = with pkgs; [
		podman-compose
	];

  # All systems using the same version (might be a bad idea idk)
  system.stateVersion = "25.11";
}
