return {
  'voldikss/vim-floaterm',
  keys = {
    { '<C-7>', ':FloatermToggle<CR>' },
    { '<C-7>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
  },
  cmd = { 'FloatermToggle' },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end,
}
