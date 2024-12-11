{
  user,
  stateVersion,
}:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";

  imports = [
    ./programs
    ./scripts
    ./shell
  ];
  programs.home-manager.enable = true;
}
