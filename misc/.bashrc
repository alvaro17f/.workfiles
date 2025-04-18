case $- in
*i*) ;;
*) return ;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s globstar
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

function joshuto() {
  ID="$$"
  mkdir -p /tmp/$USER
  OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
  env joshuto --output-file "$OUTPUT_FILE" $@
  exit_code=$?

  case "$exit_code" in
  # regular exit
  0) ;;
  # output contains current directory
  101)
    JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
    cd "$JOSHUTO_CWD"
    ;;
  # output selected files
  102) ;;
  *)
    echo "Exit code: $exit_code"
    ;;
  esac
}

function yazi() {
  tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  env yazi --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function lf() {
  cd "$(command lf -print-last-dir "$@")"
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias upnet="sudo ip link set dev eth0 mtu 1360"
alias upn="sudo ip link set dev eth0 mtu 1000"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias g="lazygit"
alias j="yazi"

# NIX #
alias rebuild="nix flake update --flake ~/.workfiles && home-manager switch --flake ~/.workfiles && nix profile wipe-history"

# UPDATE #
alias tg="topgrade"
alias nala="sudo nala"
alias cargoup="cargo install-update -a"

# TESTS #
alias t="na run test:watch $@"
alias ts="na run test:watch --silent $@"
alias tsl="DEBUG_PRINT_LIMIT=100000 na run test:watch --silent $@"
alias tl="DEBUG_PRINT_LIMIT=100000 na run test:watch $@"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export EDITOR=nvim
export GOPATH=$HOME/go
export NIX_PATH=$HOME/.nix-profile
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$NIX_PATH/bin

eval "$(fnm env --use-on-cd)"
eval "$(starship init bash)"
eval "$(fzf --bash)"

pfetch
