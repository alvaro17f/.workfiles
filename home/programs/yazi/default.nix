{ inputs, ... }:
let
  yazi-plugins = inputs.yazi-plugins;
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
