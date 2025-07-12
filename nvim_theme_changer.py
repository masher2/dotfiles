#!/Users/masher2/.venvs/Documents/bin/python
# Sourced from https://oterodiaz.com/blog/neovim-theme
# For MacOS to be able to run this script you have to run abysswatcher (https://github.com/oterodiaz/abysswatcher?tab=readme-ov-file)

import glob
from pynvim import attach

nvim_sockets = (attach('socket', path=p) for p in glob.glob('/tmp/nvim/nvim*.sock'))

for nvim in nvim_sockets:
    nvim.exec_lua('updateColorscheme()')
