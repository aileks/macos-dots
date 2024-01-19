return {
  'voldikss/vim-floaterm',
  keys = {
    { '<F7>', ':FloatermToggle<CR>' },
    { '<F7>', '<C-\\><C-n>:FloatermToggle<CR>', mode = 't' },
  },
  cmd = { 'FloatermToggle' },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end,
}
