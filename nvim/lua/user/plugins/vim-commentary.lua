return {
  'tpope/vim-commentary',
  config = function()
    vim.keymap.set('n', 'gcap', 'my<cmd>norm vip<bar>gc<cr>`y')
  end,
}
