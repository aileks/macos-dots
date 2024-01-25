-- set leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- quick nohl
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')

-- close all buffers
vim.keymap.set('n', '<leader>Q', ':bufdo bdelete<CR>')

-- open files that don't exist yet
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- keep visual selection highlighted after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- yank without jank
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- move within wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- paste without overwriting register
vim.keymap.set('v', 'p', '"_dP')

-- quick way to add semicolons and commas to the end of lines
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- prevent q:
vim.keymap.set('n', 'q:', ':q<CR>')

-- resizing
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- move text and stuff
vim.keymap.set('i', '<C-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<C-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<C-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<C-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":move '<-2<CR>gv=gv")

-- undotree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')

-- faster window switch
vim.keymap.set('n', '<leader>w', '<C-w>w')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')
