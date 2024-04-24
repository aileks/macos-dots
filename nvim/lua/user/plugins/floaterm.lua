return {
  'voldikss/vim-floaterm',
  keys = {
    { '<C-`>', ':FloatermToggle<CR>' },
    { '<C-`>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
  },
  cmd = { 'FloatermToggle' },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end,
}
