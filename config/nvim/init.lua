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
        -- Vim plugins
        'tpope/vim-repeat',  -- Repeat plugin maps
        'tpope/vim-surround',  -- Add surrounding text movements
        'mattn/calendar-vim',  -- Calendar
        {   -- Improve comment motions
            'tpope/vim-commentary',
            enabled = false
        },
        {   -- Syntax highlighting
            'sheerun/vim-polyglot',
            init = function()
                vim.g.polyglot_disabled = {'r-lang', 'python', 'tmux'}
            end
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
        {   -- Git integration
            'tpope/vim-fugitive',
            keys = {
                { '<leader>gg', '<cmd>G<cr>', silent = true},
                { '<leader>gd', '<cmd>Gdiff<cr>', silent = true},
                { '<leader>gc', '<cmd>G commit<cr>', silent = true },
                { '<leader>ga', '<cmd>G commit --amend<cr>', silent = true },
                { '<leader>gA', '<cmd>G commit --amend --no-edit<cr>', silent = true },
                { '<leader>gb', '<cmd>G blame<cr>', silent = true },
                { '<leader>gp', '<cmd>G push<cr>' },
            },
        },
        {   -- Improve code folds' format
            'masher2/readablefold.vim',
            init = function()
                vim.g['readablefold#foldlevel_char'] = '<'
                vim.g['readablefold#foldspace_char'] = ' '
                vim.g['readablefold#tabstop_char'] = '-'
            end
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

        -- nvim plugins
        {'vhyrro/luarocks.nvim', priority = 1000, config = true },  -- luarocks support
        {
            'catppuccin/nvim',
            name = 'catppuccin',
            priority = 1000,
            opts = {
                background = {
                    light = 'latte',
                    dark = 'frappe'
                },
                custom_highlights = function(colors)
                    return {
                        IndentLine = { fg = colors.base },
                        IndentLineCurrent = { fg = colors.overlay1 }
                    }
                end
            }
        },
        {
            'maxmx03/solarized.nvim',
            lazy = false,
            priority = 1000,
            variant = 'summer',
            opts = {
                on_highlights = function(colors, color)
                    return {
                        DiffAdd = { reverse = false, fg = 'NONE', bg = '#d0e2d2' },
                        DiffDelete = { reverse = false, fg = 'NONE', bg = '#eac8d4' },
                        DiffChange = { reverse = false, fg = 'NONE', bg = '#e0e7f6' },
                        DiffText = { reverse = false , fg = 'NONE', bg = '#b0c8d4' },
                        IndentLine = { fg = colors.base3 },
                        IndentLineCurrent = { fg = colors.base00 }
                    }
                end,
                styles = {
                    comments = { italic = true }
                }
            }
        },
        {   -- Hexadecimal color hints
            'norcalli/nvim-colorizer.lua', 
            init = function ()
                vim.o.termguicolors = true
            end,
            opts = { '*' }
        },
        { 'nvimdev/indentmini.nvim', config = true },  -- Indent lines
        {   -- File explorer
            'stevearc/oil.nvim',
            opts = {
                default_file_explorer = true,
                view_options = { show_hidden = true },
                keymaps = {
                    ['<C-c>'] = false,
                    ['q'] = 'actions.close', 
                },
            },
            lazy = false
        },
        {
            'nvim-treesitter/nvim-treesitter',
            branch = 'master',
            lazy = false,
            build = ':TSUpdate',
            main = 'nvim-treesitter.configs',
            opts = {
                ensure_installed = {
                    'bash',
                    'comment',
                    'dockerfile',
                    'git_config',
                    'gitcommit',
                    'gitignore',
                    'lua',
                    'luadoc',
                    'norg',
                    'r',
                    'regex',
                    'sql',
                    'terraform',
                    'toml',
                    'typescript',
                    'vim',
                    'vimdoc',
                    'yaml',
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = {'csv', 'tsv'},
                },
                -- TODO: Check keybinds
                incemental_selection = {
                    enable = true
                },
                indent = {
                    enable = true
                }
            }
        },
        {
            'nvim-neorg/neorg',
            lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
            version = "*", -- Pin Neorg to the latest stable release
            dependencies = { 'luarocks.nvim' },
            config = function()
                require('neorg').setup {
                    load = {
                        ['core.defaults'] = {},
                        ['core.concealer'] = {},
                        ['core.dirman'] = {
                            config = {
                                workspaces = {
                                    notes = '~/notes',
                                },
                                default_workspace = 'notes',
                            },
                        },
                    },
                }
            end
        },
    },
    install = { missing = true },
    checker = { enabled = true },
})


-- }}}

-- UI configs {{{

-- Auto colorscheme change {{{
function createSocket()
    pid = vim.fn.getpid()
    socket_name = '/tmp/nvim/nvim' .. pid .. '.sock'
    vim.fn.mkdir('/tmp/nvim', 'p')
    vim.fn.serverstart(socket_name)
end

function updateColorscheme()
    exit_code = os.execute("defaults read -g AppleInterfaceStyle")
    if exit_code == 0 then
        vim.cmd.colorscheme('catppuccin-frappe')
    else
        vim.cmd.colorscheme('solarized')
    end
end

vim.api.nvim_create_augroup('custom_startup', {})

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Create a socket for every nvim process',
    group = 'custom_startup',
    once = true,
    callback = createSocket
})

vim.api.nvim_create_autocmd('UIEnter', {
    desc = 'Set the appropriate theme on startup',
    group = 'custom_startup',
    once = true,
    callback = updateColorscheme
})
-- }}}

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

-- folds
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 5

-- Show <tab> and trailing spaces
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Open help in a vertical left panel
vim.api.nvim_create_autocmd( 'FileType', {pattern = 'help', command = 'wincmd H' } )

-- }}}

-- Key bindings {{{

-- Redo
vim.keymap.set('n', 'U', '<C-r>')

-- Copy into clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y$')

-- Clear search highlight
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

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

-- :diffput in visual mode
vim.keymap.set(
    'x',
    '<leader>dp',
    function()
        vim.cmd(
            vim.fn.line('v') ..
            ',' ..
            vim.fn.line('.') ..
            'diffput'
        )
        vim.api.nvim_input('<esc>')
    end
)

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

-- Other configs {{{
vim.g.python3_host_prog = vim.fn.expand('~/.venvs/Documents/bin/python')

-- }}}
