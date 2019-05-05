# vim:ft=tmux
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

set-option -g pane-border-style "fg=colour240"
set-option -g pane-active-border-style "fg=colour44"

set -g status-position bottom
set -g status-justify left
set -g status-style "none fg=colour250 bg=colour232"
set -g status-left ''
set -g status-right-length 100
set -g status-left-length 20
set -g status-right '[#S] #[fg=colour232,bg=colour240,bold] %d/%m #[fg=colour232,bg=colour242,bold] %H:%M '

setw -g window-status-current-style "bold fg=colour44 bg=colour236"
setw -g window-status-current-format ' #I#[fg=colour245]:#[fg=colour255]#W#[fg=colour44]#F '

setw -g window-status-style "none fg=colour27 bg=colour234"
setw -g window-status-format ' #I#[fg=colour240]:#[fg=colour250]#W#[fg=colour248]#F '

set-option -g window-status-bell-style "bold fg=colour255 bg=colour1"

set-option -g message-style "bold fg=colour250 bg=colour232"
