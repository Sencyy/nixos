{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    vscode
    go
    lazygit
    git
    python
    uv
    rustup
    ansible
  ];

}