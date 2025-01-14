{ pkgs, ... }:
{
  imports = [
    ./direnv
    ./fastfetch
    ./fzf
    ./gh
    ./git
    ./langs
    ./lazygit
    ./neovim
    ./ripgrep
    ./starship
    ./yazi
    ./zoxide
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
    ncdu
    nodePackages."@antfu/ni"
    ouch
    pfetch
    portal
    unzip
  ];

}
