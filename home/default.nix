{ user, ... }:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./programs
    ./scripts
    ./shell
  ];
  programs.home-manager.enable = true;
}
