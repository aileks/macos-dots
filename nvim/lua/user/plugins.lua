local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'xiyaowong/transparent.nvim',
  'mattn/emmet-vim',
  'tpope/vim-fugitive',
  'folke/zen-mode.nvim',
  {'christoomey/vim-tmux-navigator', lazy = false},
  { import = 'user.plugins.autopairs' },
  { import = 'user.plugins.cmp' },
  { import = 'user.plugins.colorizer' },
  { import = 'user.plugins.colorscheme' },
  { import = 'user.plugins.floaterm' },
  { import = 'user.plugins.harpoon' },
  { import = 'user.plugins.illuminate' },
  { import = 'user.plugins.indent-blankline' },
  { import = 'user.plugins.laravel' },
  { import = 'user.plugins.lspconfig' },
  { import = 'user.plugins.lualine' },
  { import = 'user.plugins.mini' },
  { import = 'user.plugins.noice' },
  { import = 'user.plugins.nvim-dap' },
  { import = 'user.plugins.nvim-dap-ui' },
  { import = 'user.plugins.phpactor' },
  { import = 'user.plugins.projectionist' },
  { import = 'user.plugins.telescope' },
  { import = 'user.plugins.treesitter' },
  { import = 'user.plugins.treesj' },
  { import = 'user.plugins.ts-autotag' },
  { import = 'user.plugins.vim-commentary' },
  { import = 'user.plugins.vim-pasta' },
  { import = 'user.plugins.vim-rooter' },
  { import = 'user.plugins.vim-test' },
})
