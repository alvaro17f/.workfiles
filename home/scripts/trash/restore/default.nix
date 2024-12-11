{ pkgs, ... }:
let
  name = "trash_restore";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "${name}" ''
      #!/usr/bin/env bash

      list=$(${pkgs.trashy}/bin/trash list --rev | fzf --multi)
      if [[ -n $list ]]; then
          echo $list | awk '{$1=$1;print}' | rev | cut -d ' ' -f1 | rev | xargs ${pkgs.trashy}/bin/trash restore --rev --match=exact --force
      fi
    '')
  ];

}
