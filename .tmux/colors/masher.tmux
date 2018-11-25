set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

setw -g clock-mode-colour colour5
setw -g mode-attr bold
setw -g mode-fg colour44  # Color of the copy-mode numbers
setw -g mode-bg colour240 # Color of the copy-mode bg

set -g pane-border-bg colour234        # Color of the panes divider bg
set -g pane-border-fg colour240        # Color of the panes divider fg
set -g pane-active-border-bg colour236 # Color of the current pane border bg
set -g pane-active-border-fg colour44  # Color of the current pane border fg

set -g status-position bottom # Position of the status bar
set -g status-justify left    # Justify the window tabs to the left
set -g status-bg colour232    # Color of the status bar bg
set -g status-fg colour250    # Color of the session name
set -g status-attr dim        # ???
set -g status-left ''     # Remove session name ???
set -g status-right '[#S] #[fg=colour232,bg=colour240,bold] %d/%m #[fg=colour232,bg=colour242,bold] %H:%M '
set -g status-right-length 50
set -g status-left-length 20
 
setw -g window-status-current-fg colour44    # Color of the current window index
setw -g window-status-current-bg colour236   # Color of the current window status bg
setw -g window-status-current-attr bold      # Current window text is bold
setw -g window-status-current-format ' #I#[fg=colour245]:#[fg=colour255]#W#[fg=colour44]#F '

setw -g window-status-fg colour27  # Color of the non active windows' index
setw -g window-status-bg colour234 # Color of the non active windows' bg
setw -g window-status-attr none    # Non active windows text is normal
setw -g window-status-format ' #I#[fg=colour240]:#[fg=colour250]#W#[fg=colour248]#F '

setw -g window-status-bell-attr bold
setw -g window-status-bell-fg colour255
setw -g window-status-bell-bg colour1

set -g message-attr bold
set -g message-fg colour250
set -g message-bg colour232
