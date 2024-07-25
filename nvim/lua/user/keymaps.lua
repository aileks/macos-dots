-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlight on esc
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>')

-- Keep selection highlighted after indent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Yank without jank
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- Move between wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better paste
vim.keymap.set('v', 'p', '"_dP')

-- Move lines easier
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi', { silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi', { silent = true })
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==', { silent = true })
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==', { silent = true })
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv", { silent = true })

-- Better <esc>
vim.keymap.set('i', 'jk', '<Esc>')

-- Niceties for movement
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Open netrw
vim.keymap.set('n', '<leader>e', vim.cmd.Lex)

-- Easier save & quit
vim.keymap.set('n', '<leader>w', vim.cmd.w)
vim.keymap.set('n', '<leader>W', vim.cmd.wall)
vim.keymap.set('n', '<leader>q', vim.cmd.q)
