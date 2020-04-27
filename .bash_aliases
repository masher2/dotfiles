# Python commands
alias tst='python -m unittest'
alias actenv='source actenv'

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
alias assets='ledger --no-total bal Assets'

# Colorized commands
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='sudo pacman --color=auto'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

