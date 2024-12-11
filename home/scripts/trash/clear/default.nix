{ pkgs, ... }:
let
  name = "trash_clear";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "${name}" ''
      #!/usr/bin/env bash
      ${pkgs.trashy}/bin/trash empty --all
    '')
  ];

}
