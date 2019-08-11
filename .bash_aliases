# Python commands
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
alias assets='ledger --no-total bal Assets'
