{ pkgs, ... }:
{

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.gnome.gnome-keyring.enable = true; # something something some apps may neet it idk

  environment.systemPackages = with pkgs; [
    grim
    slurp
    wl-clipboard
    foot
    i3status

    # Window manager commons TODO: move to separate package
    gammastep
    mako
  ];


}