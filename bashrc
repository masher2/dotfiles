# vim:foldmethod=marker

# Configs ------------------------------------------------------------------ {{{

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

stty -ixon
set -o vi

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# }}}

# Prompt ------------------------------------------------------------------- {{{

PROMPT_COMMAND='pwd2=$(p="${PWD#${HOME}}"; [ "${PWD}" != "${p}" ] && printf "~";IFS=/; for q in ${p:1}; do printf /${q:0:1}; done; printf "${q:1}")'
# PS1='\u@\h:$pwd2\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[92m\]\u@\h\[\033[00m\]:\[\033[94m\]$pwd2\[\033[00m\]\$ '

# }}}

# Bash completion ---------------------------------------------------------- {{{

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# }}}

# Environment variables ---------------------------------------------------- {{{

export LEDGER_FILE="$HOME/phone/documents/masher.ldg"

export PYTHONBREAKPOINT='ipdb.set_trace'

export TIMELOG="$XDG_DOCUMENTS_DIR/timelog.ldg"

export PGDATA=/var/lib/postgres/data

# }}}

# Aliases ------------------------------------------------------------------ {{{
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# }}}

# Misc --------------------------------------------------------------------- {{{

# Enable tmux-git
if [[ $TMUX ]]; then
    source ~/.tmux/tmux-git.sh;
fi

# }}}


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
