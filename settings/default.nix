{ ... }:
{
  user = "x209423";
  system = "x86_64-linux";

  shell = "bash";

  timezone = "Europe/Madrid";
  locale = "es_ES.UTF-8";

  keyboard = {
    layout = "us";
    variant = "altgr-intl";
    options = "caps:swapescape";
  };

  git.email = "alvaro.garciamacias@servexternos.gruposantander.com";

  apps = {
    editor = "nvim";
    explorer = "yazi";
    git = "lazygit";
    pager = "less";
    prompt = "starship";
    terminal = "xterm-256color";
    top = "btop";
  };
}
