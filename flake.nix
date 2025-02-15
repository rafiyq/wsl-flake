# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.default 
        {
          system.stateVersion = "24.05";
          wsl.enable = true;
          wsl.defaultUser = "user";
        }

        ({ pkgs, ... }: {
          users.defaultUserShell = pkgs.fish;
          nix.settings.experimental-features = ["nix-command" "flakes"];
        })

        ./programs.nix
      ];
    };
  };
}
