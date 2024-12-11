{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    hash = "sha256-By8XuqVJvS841u+8Dfm6R8GqRAs0mO2WapK6r2g7WI8=";
  };
in
{
  imports = [
    ./keymap
    ./settings
    ./shell
  ];

  programs.yazi = {
    enable = true;
    initLua = ./lua/init.lua;
    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      git = "${yazi-plugins}/git.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
    };
  };
}
