-- vim:foldmethod=marker
-- Plugins {{{

-- Bootstrap lazy.nvim {{{
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- Setup lazy.nvim
require('lazy').setup({
    spec = {
        'tpope/vim-repeat',  -- Repeat plugin maps
        'tpope/vim-surround',  -- Add surrounding text movements
        'mattn/calendar-vim',  -- Calendar
        'ap/vim-css-color',  -- Hexadecimal color hints
        {   -- Improve comment motions
            'tpope/vim-commentary',
            enabled = false
        },
        {   -- Indent lines
            'nvimdev/indentmini.nvim',
            config = function()
                require('indentmini').setup()
            end
        },
        {   -- File explorer
            'stevearc/oil.nvim',
            config = function()
                require('oil').setup({
                    default_file_explorer = true,
                    view_options = {
                        show_hidden = true
                    },
                    keymaps = {
                        ["<C-c>"] = false,
                        ["q"] = "actions.close",
                    },
                })
            end,
            lazy = false
        },
        {
            "christoomey/vim-tmux-navigator",
            keys = {
                { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = {'n', 't'} },
                { "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = {'n', 't'} },
                { "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = {'n', 't'} },
                { "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = {'n', 't'} },
            },
        },
        {   -- Fuzzy finder
            'junegunn/fzf',
            keys = {
                { '<leader>e', ':call fzf#run(fzf#wrap({"sink": "e"}))<CR>' },
                { '<leader>t', ':call fzf#run(fzf#wrap({"sink": "tabedit"}))<CR>' },
                { '<leader>/', ':call fzf#run(fzf#wrap({"sink": "sp"}))<CR>' },
                { '<leader>\\', ':call fzf#run(fzf#wrap({"sink": "vsp"}))<CR>' },
            }
        },
        {   -- Git integration
            'tpope/vim-fugitive',
            keys = {
                { '<leader>gg', '<cmd>Git<cr>', silent = true},
                { '<leader>gd', '<cmd>Gdiff<cr>', silent = true},
                { '<leader>gc', '<cmd>Git commit<cr>', silent = true },
                { '<leader>ga', '<cmd>Git commit --amend<cr>', silent = true },
                { '<leader>gA', '<cmd>Git commit --amend --no-edit<cr>', silent = true },
                { '<leader>gb', '<cmd>Git blame<cr>', silent = true },
                { '<leader>gp', '<cmd>Git push<cr>' },
            },
        },
        {   -- Syntax highlighting
            'sheerun/vim-polyglot',
            init = function()
                vim.g.polyglot_disabled = {'r-lang', 'python', 'tmux'}
            end
        },
        {   -- Improve code folds' format
            'masher2/readablefold.vim',
            init = function()
                vim.g['readablefold#foldlevel_char'] = '<'
                vim.g['readablefold#foldspace_char'] = ' '
                vim.g['readablefold#tabstop_char'] = '-'
            end
        },
    },
    install = { missing = true, colorscheme = { 'lucario' } },
    checker = { enabled = true },
})


-- }}}

-- UI configs {{{
    vim.cmd.colorscheme('lucario')
    vim.o.mouse = 'a'
    vim.o.confirm = true
    vim.o.swapfile = false

    -- Line numbers
    vim.o.number = true
    vim.o.relativenumber = true

    -- Cursor line
    local cursorline = vim.api.nvim_create_augroup('cursorline', {clear = true})
    vim.api.nvim_create_autocmd(
        {'VimEnter', 'WinEnter', 'BufWinEnter'},
        {pattern = '*', group = cursorline, callback = function() vim.opt_local.cursorline = true end }
    )
    vim.api.nvim_create_autocmd(
        {'WinLeave'},
        {pattern = '*', group = cursorline, callback = function() vim.opt_local.cursorline = false end }
    )

    -- split in the right direction
    vim.o.splitbelow = true
    vim.o.splitright = true

    -- Remove min size limitations for when maximizing splits
    vim.o.winminheight = 0
    vim.o.winminwidth = 0

    -- indent with 4 spaces
    local tabwidth = 4
    vim.o.tabstop = tabwidth
    vim.o.shiftwidth = tabwidth
    vim.o.softtabstop = tabwidth
    vim.o.expandtab = true
    vim.o.shiftround = true
    vim.cmd.highlight('IndentLine guifg=#2b3e50')
    vim.cmd.highlight('IndentLineCurrent guifg=#f8f8f2')

    -- folds
    vim.o.foldmethod = 'indent'
    vim.o.foldnestmax = 5

    -- Show <tab> and trailing spaces
    vim.o.list = true
    vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- }}}

-- Key bindings {{{

    -- Redo
    vim.keymap.set('n', 'U', '<C-r>')

    -- Copy into clipboard
    vim.keymap.set('n', '<leader>y', '"+y')
    vim.keymap.set('n', '<leader>Y', '"+y$')

    -- Window resizing
    vim.keymap.set('n', '<leader>w', '<C-w>')
    vim.keymap.set('n', '<leader>wz', '<C-w>_<C-w>|')
    vim.keymap.set('n', '<leader>w\\', '<cmd>exec "vertical resize " (&numberwidth + 80)<cr>')
    vim.keymap.set('n', '<leader>w/', '<cmd>resize 40<cr>')
    vim.keymap.set('n', '<leader>w,', '10<C-w><')
    vim.keymap.set('n', '<leader>w.', '10<C-w>>')

    -- Manual diffs
    vim.keymap.set('n', '<leader>dt', '<cmd>diffthis<cr>')
    vim.keymap.set('n', '<leader>do', '<cmd>diffoff<cr>')

    -- Saving and quitting
    vim.keymap.set('n', '<M-w>', '<cmd>w<cr>')
    vim.keymap.set('n', '<M-q>', '<cmd>q<cr>')

    -- Tab Navigation
    vim.keymap.set({'n', 't'}, '<M-h>', '<cmd>tabprevious<cr>')
    vim.keymap.set({'n', 't'}, '<M-l>', '<cmd>tabnext<cr>')

    -- Open a terminal
    vim.keymap.set('n', '<leader>b/', '<cmd>sp term://bash<cr>')
    vim.keymap.set('n', '<leader>b\\', '<cmd>vsp term://bash<cr>')

    -- Terminal configs
    vim.keymap.set('t', '<C-space>', [[<C-\><c-n>]])
    vim.api.nvim_create_autocmd(
        'BufEnter',
        { pattern = 'term://*', callback = function() vim.cmd.startinsert() end}
    )

    -- Scrolling
    vim.keymap.set('n', '<M-k>', '<C-u>')
    vim.keymap.set('n', '<M-j>', '<C-d>')

    -- Open the file explorer
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Turn on and off the color column
    vim.keymap.set(
        'n',
        '<leader>C',
        function()
            if vim.o.colorcolumn == ''
                then vim.o.colorcolumn = '80'
                else vim.o.colorcolumn = ''
            end
        end
    )

    -- Folding
    vim.keymap.set('n', '<Space>', 'za')
    vim.keymap.set('n', '<M-Space>', 'zA')

    -- Set folding levels
    for i = 0, 9 do
        vim.keymap.set('n', '<leader>f'..i, ':set foldlevel='..i..'<cr>')
    end

-- }}}
