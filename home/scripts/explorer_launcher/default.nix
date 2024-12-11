{ pkgs, settings, ... }:
let
  name = "explorer_launcher";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "${name}" ''
      #!/usr/bin/env bash

      function lf() {
        cd "$(command lf -print-last-dir "$@")"
      }

      function joshuto() {
        ID="$$"
        mkdir -p /tmp/$USER
        OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
        env $HOME/.config/joshuto/preview/ueberzug/joshuto --output-file "$OUTPUT_FILE" "$@"
        exit_code=$?

        case "$exit_code" in
          0)
            ;;
          101)
            JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
            cd "$JOSHUTO_CWD" || exit 1
            ;;
          102)
            ;;
          *)
            echo "Exit code: $exit_code"
            ;;
        esac
      }

      function yazi() {
        tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        command yazi --cwd-file="$tmp" "$@"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      if [[ ${settings.shell} == "fish" ]]; then
        exec fish -C ${settings.apps.explorer}

      else

        if [[ ${settings.apps.explorer} == "lf" ]]; then
          exec ${settings.shell} -c "$(typeset -f lf); lf && ${settings.shell}"

        elif [[ ${settings.apps.explorer} == "yazi" ]]; then
          exec ${settings.shell} -c "$(typeset -f yazi); yazi && ${settings.shell}"

        elif [[ ${settings.apps.explorer} == "joshuto" ]]; then
          exec ${settings.shell} -c "$(typeset -f joshuto); joshuto && ${settings.shell}"
        fi

      fi
    '')
  ];

}
