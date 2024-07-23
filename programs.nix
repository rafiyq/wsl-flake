# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
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
    interactiveShellInit = ''
      function border --on-event fish_postexec
          string repeat --count $COLUMNS _
      end
      set -U fish_greeting
    '';
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
    presets = [ "plain-text-symbols" ];
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[❯](bold dimmed green)[❯](bold green)[❯](bold bright-green)";
        error_symbol = "[❯](bold dimmed red)[❯](bold red)[❯](bold bright-red)";
      };
    };
  };
}
