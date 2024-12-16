{ user, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # historyFile = null;
    # historyFileSize = 0;
    initExtra = ''
      if [ -e /home/${user}/.nix-profile/etc/profile.d/nix.sh ]; then
        . /home/${user}/.nix-profile/etc/profile.d/nix.sh
      fi

      eval "$(zoxide init bash)"
      eval "$(fnm env --use-on-cd)"

      fastfetch
    '';
    bashrcExtra = ''
      set -o vi
      set -o noclobber # Use `>|` to force redirection to an existing file

      bind 'set bell-style none'

      bind 'set show-all-if-ambiguous on'
      bind 'set completion-ignore-case on'
      bind 'set completion-map-case on'
      bind 'set mark-symlinked-directories on'

      bind 'set show-mode-in-prompt on'
      bind 'set vi-cmd-mode-string "\1\e[2 q\2"'
      bind 'set vi-ins-mode-string "\1\e[6 q\2"'

      shopt -s autocd
      shopt -s dirspell
      shopt -s cdspell
      shopt -s globstar
      shopt -s nocaseglob
      shopt -s checkwinsize
    '';
  };
}
