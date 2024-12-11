{ ... }:
{
  programs.bash.shellAliases = {
    yazi = ''
      tmp="$(mktemp -t "yazi-cwd.XXXXX")"
      command yazi --cwd-file="$tmp" "$@"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    '';
  };

  programs.fish.functions = {
    yazi = ''
      set tmp (mktemp -t "yazi-cwd.XXXXX")
      command yazi $argv --cwd-file="$tmp"
      if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
      end
      rm -f -- "$tmp"
    '';
  };

  programs.zsh.initExtra = ''
    yazi() {
      tmp="$(mktemp -t "yazi-cwd.XXXXX")"
      command yazi --cwd-file="$tmp" "$@"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
  '';
}
