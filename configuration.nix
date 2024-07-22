# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;
  environment.systemPackages = [
    pkgs.aria2
    pkgs.helix
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      gss = "git status --short";
      gst = "git status";
      ga = "git add";
      gaa = "git add --all";
      gcmsg = "git commit --message";
      gcam = "git commit --all --message";
      gp = "git push";
      gd = "git diff";
      gc = "git clone --recurse-submodules";
    };
    interactiveShellInit = "set -U fish_greeting";
  };

  programs.git = {
    enable = true;
    config = {
      core.editor = "hx";
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
  };
}
