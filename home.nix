{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.packages = [
    pkgs.git
    pkgs.helix
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
