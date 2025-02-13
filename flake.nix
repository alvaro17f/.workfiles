{
  description = "Work";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      settings = import ./settings { };
      user = settings.user;
      system = settings.system;

      path = rec {
        home = "/home/${user}";
        config = "${home}/.config";
        local = "${home}/.local";
        dotfiles = "${home}/.workfiles";
        workspace = "${home}/Workspace";

        #===== directories =====#
        desktop = "${home}/Desktop";
        documents = "${home}/Documents";
        download = "${home}/Downloads";
        music = "${home}/Music";
        pictures = "${home}/Pictures";
        public = "${home}/Public";
        templates = "${home}/Templates";
        videos = "${home}/Videos";
      };

      pkgs = import nixpkgs {
        system = system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      extraArgs = {
        inherit
          inputs
          user
          path
          settings
          ;
      };
    in
    {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = extraArgs;
        modules = [
          ./home
        ];
      };
    };
}
