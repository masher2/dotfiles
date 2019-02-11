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
    if [[ $dir == .dotfiles ]]; then
        tmux new -s dotfiles;
    else
        tmux new -s $dir;
    fi
}

# Slack aliases
alias slack-ewm='slack-term -config ~/.slack-tokens/ewm'
alias slack-aa='slack-term -config ~/.slack-tokens/aa'
alias slack-angul='slack-term -config ~/.slack-tokens/angul'

# Utils
alias tree='tree -I __pycache__'
alias stree='tree -d -L 2 -I __*__'

# Ledger aliases
alias led='nvim ~/masher.ldg'
alias ledger='ledger -f ~/masher.ldg'
alias assets='ledger --no-total bal Assets'
