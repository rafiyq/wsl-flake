{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.packages = [];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  programs.aria2 = {
    enable = true;
    settings = {
      continue = true;
      max-connection-per-server = 16;
      min-split-size = "8M";
      retry-wait = 1;
      split = 32;
      ftp-pasv = true;
      max-upload-limit = "1K";
      seed-time = 0;
    };
  };

  programs.git = {
    enable = true;
    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
    };
  };

  programs.helix = {
    defaultEditor = true;
    enable = true;
    settings = {
      editor = {
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
      keys.insert = {
        j = { k = "normal_mode"; }; # Maps `jk` to exit insert mode
      };
    };
  };
}
