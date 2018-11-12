# Python virtual environments
source ~/.scripts/venv_utils.sh

# Django commands
alias runserver='python manage.py runserver'
alias dshell='python manage.py shell'
alias migrate='python manage.py migrate'
alias dj='python manage.py'

# Tmux alias
alias tnew='tmux new -s ${PWD##*/}'

# Slack aliases
alias slack-ewm='slack-term -config ~/.slack-tokens/ewm'
alias slack-aa='slack-term -config ~/.slack-tokens/aa'
alias slack-angul='slack-term -config ~/.slack-tokens/angul'

# Utils
alias tree='tree -I __pycache__'
alias stree='tree -d -L 2 -I __*__'
