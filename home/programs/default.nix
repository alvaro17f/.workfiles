{ pkgs, ... }:
{
  imports = [
    ./fastfetch
    ./fzf
    ./git
    ./lazygit
    ./yazi
  ];

  home.packages = with pkgs; [
    # home-manager
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
    ouch
    pfetch
    portal
    ripgrep
    rustup
    starship
    unzip
    zig
    zoxide
  ];

}
