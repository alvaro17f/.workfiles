{
  pkgs,
  path,
  settings,
  ...
}:
let
  name = "git_launcher";
  git_app = settings.apps.git;
  git_bin = "${pkgs.${git_app}}/bin/${git_app}";

  path_command =
    if git_app == "lazygit" then
      "-p"
    else if git_app == "gitui" then
      "-d"
    else
      "";

in
{
  home.packages = [
    (pkgs.writeShellScriptBin "${name}" ''
      #!/usr/bin/env bash

      is_git_repo() {
        ${pkgs.git}/bin/git rev-parse --is-inside-work-tree > /dev/null 2>&1
      }

      if is_git_repo; then
        ${git_bin}
      else
        ${git_bin} ${path_command} "${path.dotfiles}"
      fi
    '')
  ];
}
