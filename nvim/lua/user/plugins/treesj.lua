return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { '<leader>j', function() require('treesj').join() end },
    { '<leader>k', function() require('treesj').split() end },
  },
  opts = {
    use_default_keymaps = false,
  },
}
