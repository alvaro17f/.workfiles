{
  lib,
  pkgs,
  settings,
  ...
}:
{
  imports = [
    ./fastfetch
    ./fzf
    ./git
    ./lazygit
    ./yazi
  ];

  home.packages = with pkgs; [
    home-manager
    nixfmt-rfc-style
    ########
    bat
    btop
    fd
    fnm
    gnutar
    go
    ncdu
    neovim
    nodePackages."@antfu/ni"
    pfetch
    ripgrep
    rustup
    starship
    unzip
    zig
    zoxide
  ];

}
