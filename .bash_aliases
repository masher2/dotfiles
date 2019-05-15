# Python commands
if [[ -f ~/scripts/venv_utils.sh ]]; then
    source ~/scripts/venv_utils.sh;
fi
alias tst='python -m unittest'

# Django commands
runserver() {
    if [[ -f manage.py ]]; then
        python manage.py runserver
    else
        python app.py
    fi
}
alias dshell='python manage.py shell'
alias migrate='python manage.py migrate'
alias dj='python manage.py'

# Tmux alias
alias tnew='tmux new -s "${PWD##*/}"'

# Utils
alias tree='tree -I __pycache__'
alias stree='tree -d -L 2 -I __*__'

# Ledger aliases
alias led="nvim $LEDGER_FILE"
alias ledger="ledger -f $LEDGER_FILE"
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

