{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./fastfetch
    ./fzf
    ./git
    ./lazygit
    ./neovim
    ./ripgrep
    ./starship
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
    nodePackages."@antfu/ni"
    ouch
    pfetch
    portal
    rustup
    unzip
    zig
    zoxide
  ];

}
