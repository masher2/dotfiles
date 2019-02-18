# Python virtual environments
if [[ -f ~/scripts/venv_utils.sh ]]; then
    source ~/scripts/venv_utils.sh;
fi
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'

# Django commands
alias runserver='python manage.py runserver'
alias dshell='python manage.py shell'
alias migrate='python manage.py migrate'
alias dj='python manage.py'

# Tmux alias
tnew() {
    dir=${PWD##*/}
    tmux new -s $dir;
}

# Utils
alias tree='tree -I __pycache__'
alias stree='tree -d -L 2 -I __*__'

# Ledger aliases
alias led='nvim ~/masher.ldg'
alias ledger='ledger -f ~/masher.ldg'
alias assets='ledger --no-total bal Assets'


# Misc stuff gotten from the internet
extract () {
    # https://github.com/BradHeff/ArcoLinux-dotfiles/blob/master/.bashrc
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

