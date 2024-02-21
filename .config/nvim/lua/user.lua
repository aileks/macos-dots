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
    'tpope/vim-surround',

    { import = 'plugins.autopairs' },
    { import = 'plugins.cmp' },
    { import = 'plugins.colorizer' },
    { import = 'plugins.copilot' },
    { import = 'plugins.floaterm' },
    { import = 'plugins.illuminate' },
    { import = 'plugins.indent-blankline' },
    { import = 'plugins.laravel' },
    { import = 'plugins.lspconfig' },
    { import = 'plugins.lualine' },
    -- { import = 'plugins.noice' },
    { import = 'plugins.phpactor' },
    { import = 'plugins.projectionist' },
    { import = 'plugins.monokai-pro' },
    { import = 'plugins.telescope' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.treesj' },
    { import = 'plugins.ts-autotag' },
    { import = 'plugins.vim-commentary' },
    { import = 'plugins.vim-pasta' },
    { import = 'plugins.vim-rooter' },
    { import = 'plugins.vim-test' },
})
